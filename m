Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp3890505lfb;
        Fri, 25 Mar 2022 01:18:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzeAC9dGLKa5w09hVKVvON8ukFrr4N/gph40sGAfIY3G9TAIBsCgjuM55Pc61OCd6hJPu3T
X-Received: by 2002:a05:622a:1802:b0:2e1:abdb:e522 with SMTP id t2-20020a05622a180200b002e1abdbe522mr8180168qtc.144.1648196291565;
        Fri, 25 Mar 2022 01:18:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648196291; cv=none;
        d=google.com; s=arc-20160816;
        b=u69YYG/z+y24n39UI+Oj7tBeOiMXAn/W/LEG90VxV4FHEt+ed7gAWD2y5yY8xt1F4q
         ch70rmBbQYxDR6hZO70r1g+8qiJmqTeyDwi/PIIwIa5iuin3vd2RvURM6jCpqTWDXyv/
         oceoEAa+TR78szge1W0Bg0BXswsPVaYnwTOeK2CNd9FCxxgFZcEBJK0u2GZaqor4h3K4
         5EteCbXJiIo2vxeMRXX5nScccqgSXtWSv/8Cc2puynt5Qa+fZ+FOaCWyG0257w9/0dMr
         IrBKhCFhk+IIgBQ0TQlTzukup/Db7kqobpc51TODX2pblqnU0VrSEKbNbYzOtkelVNIf
         nkig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:to:from:dkim-signature;
        bh=XoOKNvjj2vWDxyF7ffnwny5Y6LqscjN6R/Mgh0N0bXE=;
        b=hNv05Alq/PQjGTEiseixL/8dLvMYgfJlek+Fa5sPEBgzjtKp+CSemuMiwnMti60dhJ
         CMJmiDeeJfLc6rTB4md92cr1/FPivEbjNF4TurXLQAOnG3c8yvrmPhtoOhG0mBSQUVnF
         wHtUXWWHHrqPiv9wDXcQ/atwNsrmuN+0yCaAAdJqwLJFDl+lRVxOU38Avbb3mItUIzcb
         NRRDnZRTlbGs4c7+QJSPy100k6OVVseZELnxI7tNLxvYcPWkJI8COFWqn6JM/aimfGZ4
         Py8Rv/AeF6sTu+p/U5T+yEDYyaQeofaTEWu7RWi3lzzzH1tYnyiYVBX+fY5egw5LdE1t
         uk9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cJZEZxEl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bv8-20020ad44888000000b004411053a694si773958qvb.127.2022.03.25.01.18.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Mar 2022 01:18:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cJZEZxEl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nXf99-000352-0s
	for alex.bennee@linaro.org; Fri, 25 Mar 2022 04:18:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nXf7y-00034I-3j
 for qemu-arm@nongnu.org; Fri, 25 Mar 2022 04:16:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nXf7v-0001x4-IV
 for qemu-arm@nongnu.org; Fri, 25 Mar 2022 04:16:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648196214;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XoOKNvjj2vWDxyF7ffnwny5Y6LqscjN6R/Mgh0N0bXE=;
 b=cJZEZxElorQ/IqDqXI/SzjQWeKK0l7pulVYlwpalrNu4lAJSJp2uM+OBpeRAvJL9ecBjOe
 RLhZ85PZ2+FNPiSrz4CafISSxkZXAXLEH8MlWWyMh0TQPX3dK5vKzYCC6euFY7GVodDESg
 9z572BG1aOvVVycPlecXNqB48bXvtn8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-241-ev0jLdd2M-ikfYxZyxb6jg-1; Fri, 25 Mar 2022 04:16:53 -0400
X-MC-Unique: ev0jLdd2M-ikfYxZyxb6jg-1
Received: by mail-wr1-f72.google.com with SMTP id
 j67-20020adf9149000000b00203e6b7d151so2449752wrj.13
 for <qemu-arm@nongnu.org>; Fri, 25 Mar 2022 01:16:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lwOCm9uy0SJhZBHOauUhE1KdI2YgTHt0QQdRB9YjSqU=;
 b=njIPXfOb8o9ujFZtAcOgzicqT9Ku5NWVpMjpoFa2KetzyGGAG4ZHPYImpzcYCZGeRb
 6l8zcXdIMVTF95jGuW+D34W5mOTBCern3kbaVi6Njy9E7BsjdrP360xrpYiKz38LuEsr
 VhxDCGGiCpMBs7jIMS5jwPJYdSPq6N27Xd8NaQz9QFqqVC4YYjgrqZGHIahg1SuMW/af
 YhdSKmWyvjJsa+EXeDaFhqmdD/PNdOtqhdboSoXJmUbTxlVqKklTUZzIck4fX1+0mp6k
 dlOI1LhAO/FXpWEuFcjdwMV1evdRCosdtYVcy55hAn0jq9+k27hAsHwqdx+4yD73AoxX
 R1wg==
X-Gm-Message-State: AOAM531LEp7NpJSe5mDVrvBWVwgAZl7VXGCmjAgYlRxGvqcohUpB11Y4
 BP5oKDvbKtETSypY+mDiIJrgq0PxYrwmymwy6huOZwrzTImlU2iFuSkO9DyAH6qwupYb72nqSuX
 z6OaU8ueFs0gf
X-Received: by 2002:a5d:584f:0:b0:204:1749:2ce7 with SMTP id
 i15-20020a5d584f000000b0020417492ce7mr7905361wrf.584.1648196212048; 
 Fri, 25 Mar 2022 01:16:52 -0700 (PDT)
X-Received: by 2002:a5d:584f:0:b0:204:1749:2ce7 with SMTP id
 i15-20020a5d584f000000b0020417492ce7mr7905325wrf.584.1648196211800; 
 Fri, 25 Mar 2022 01:16:51 -0700 (PDT)
Received: from localhost ([47.63.10.52]) by smtp.gmail.com with ESMTPSA id
 m13-20020a05600c3b0d00b0038cda9f92fasm2453441wms.0.2022.03.25.01.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 01:16:51 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH 28/32] Move CPU softfloat unions to cpu-float.h
In-Reply-To: <20220323155743.1585078-29-marcandre.lureau@redhat.com>
 (marcandre lureau's message of "Wed, 23 Mar 2022 19:57:39 +0400")
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
 <20220323155743.1585078-29-marcandre.lureau@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Fri, 25 Mar 2022 09:16:50 +0100
Message-ID: <87r16qe9al.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: quintela@redhat.com
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, "open
 list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d080UOGEJGYB

marcandre.lureau@redhat.com wrote:
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> The types are no longer used in bswap.h since commit
> f930224fffe ("bswap.h: Remove unused float-access functions"), there
> isn't much sense in keeping it there and having a dependency on fpu/.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> diff --git a/migration/vmstate-types.c b/migration/vmstate-types.c
> index bf4d440308ea..e83bfccb9ecf 100644
> --- a/migration/vmstate-types.c
> +++ b/migration/vmstate-types.c
> @@ -11,6 +11,7 @@
>   */
> =20
>  #include "qemu/osdep.h"
> +#include "qemu/cpu-float.h"
>  #include "qemu-file.h"
>  #include "migration.h"
>  #include "migration/vmstate.h"

Reviewed-by: Juan Quintela <quintela@redhat.com>

I think that the rest of the patch is also correct, but as there are
other maintainers involved.


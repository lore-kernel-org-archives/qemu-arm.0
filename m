Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp61283lfp;
        Fri, 15 Jul 2022 01:34:18 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uk7j+91Nm28pbhIXNZm10dLRDQLuGALcMqk4c/S1XiGSTSco/8vacG+YAOAVmKjU/tEyRg
X-Received: by 2002:ac8:5f13:0:b0:31b:b33f:2c09 with SMTP id x19-20020ac85f13000000b0031bb33f2c09mr11117296qta.686.1657874058450;
        Fri, 15 Jul 2022 01:34:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657874058; cv=none;
        d=google.com; s=arc-20160816;
        b=KdgJF3gsvCHFPetmMbEPMYdMW2MX0XZr2OG3OC2aA8loX/nVhF3ZjIegKUS7WvCf69
         CUUVzbPUAWWUmhg+rVpGmWJnyjfALkseSlMigprp/YHdnrB40VlOfj90FBk1kaesa7rN
         nSzT7f4/9H6pLy8J1MgEH0PPxyNWZMuSw2vEFMAq2S7sYZgYk0DX1/A3v55wo6oFuy2p
         xw3ED9bvRLP15jrwn0Zgf/bXBBEqUaJqjAIClqfwbBVBZ7eAcM7K2Rca0Ima2j/wLW2H
         VnTo25uJlJUrEbsKTNEUbyWD/OddoiWDhMnHw2IwCwCM1bjPerBHBmOKYkx76uVIaepB
         Gnsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:user-agent:references:organization
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=pFE/4FDrMrV/7cJaV1hCuvCDShBasZB6PTY0z3Hadas=;
        b=syLcdB8L9bA2tku/b49YOsnmVKwE2rr5Z9DYUyq5lC5FqY9T1KH2CGVUmEigqO+5Om
         /sPXhrmNklrTmwKYvK8YENbGz7B0Q9wpXBGIAPDbUffFunTfKMLXHAFubzPrWarcRX9U
         hnrbmmM8AnD2WcFyYQExsRgsUxTpbL41K/jxxvXwk3ce+M9uPvvHSVLjWr3ralIX0F5v
         DwylN7UlvPQ6Yue6lE2sZ1Dw250prQa0wVbxxUqwWuW5LgXcG4g8dj+0qiaa+rHtK855
         fwku7dUn6PQLMI2PW4+gN6UM5r18w4fBhOLPAJ54oLALC0rPmMPxPuYv2r40C763Bc1I
         19sQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hI6HnfHI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l22-20020a37f516000000b006af647be91fsi2060348qkk.376.2022.07.15.01.34.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Jul 2022 01:34:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hI6HnfHI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oCGm9-0003WZ-VE
	for alex.bennee@linaro.org; Fri, 15 Jul 2022 04:34:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oCGlf-0003U5-It
 for qemu-arm@nongnu.org; Fri, 15 Jul 2022 04:33:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1oCGlb-0002nU-LO
 for qemu-arm@nongnu.org; Fri, 15 Jul 2022 04:33:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657874022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pFE/4FDrMrV/7cJaV1hCuvCDShBasZB6PTY0z3Hadas=;
 b=hI6HnfHIuW9cwXTBhIlYglH70p3OE+Gu3rDECg1cG6KqbVk9EBx4XvOPArvao5IApGwnQh
 aJJk/6ssrfDD20cynquQbK7b6AENNxisLPoiBHAEQCfpHAYijMJ6ykTVpoO+i5tMODfPdz
 kVnMeUsu8rNqW4YCM5sH2GPkf6vV8t0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-180-vbAexJHqNAKJxrUniCLwUA-1; Fri, 15 Jul 2022 04:33:39 -0400
X-MC-Unique: vbAexJHqNAKJxrUniCLwUA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 818561C288C0;
 Fri, 15 Jul 2022 08:33:38 +0000 (UTC)
Received: from localhost (dhcp-192-213.str.redhat.com [10.33.192.213])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CB731121314;
 Fri, 15 Jul 2022 08:33:38 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, David Hildenbrand <david@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
Subject: Re: [PATCH 2/3] target/s390x: display deprecation note in '-cpu help'
In-Reply-To: <20220714150735.1835166-3-berrange@redhat.com>
Organization: Red Hat GmbH
References: <20220714150735.1835166-1-berrange@redhat.com>
 <20220714150735.1835166-3-berrange@redhat.com>
User-Agent: Notmuch/0.36 (https://notmuchmail.org)
Date: Fri, 15 Jul 2022 10:33:37 +0200
Message-ID: <87v8ry3hcu.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: meEih6MhGrPA

On Thu, Jul 14 2022, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> The deprecation notes are currently only displayed at runtime when the
> user activates a CPU. The QMP query displays a simple flag for
> deprecation, while '-cpu help' displays nothing unless the deprecation
> info is duplicated into the 'notes' field.
>
> This changes the code so that deprecation notes are explicitly shown
> in '-cpu help', to assist the user in deciding what to use.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ---
>  target/s390x/cpu_models.c | 28 +++++++++++++++++++++++-----
>  1 file changed, 23 insertions(+), 5 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


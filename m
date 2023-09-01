Received: by 2002:a17:907:76b5:b0:9a1:fa4e:495e with SMTP id jw21csp453167ejc;
        Fri, 1 Sep 2023 01:05:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETu3uaQv14GnC/X78OmFPTcuYIv0Ofc9Ing7hsuORCV0xicqOH+sS/O2I2+hAat0ZCph8r
X-Received: by 2002:a05:620a:2a0a:b0:76c:9769:9e1a with SMTP id o10-20020a05620a2a0a00b0076c97699e1amr6568680qkp.17.1693555520917;
        Fri, 01 Sep 2023 01:05:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693555520; cv=none;
        d=google.com; s=arc-20160816;
        b=seVUppNnc1rc67slvLdxTCQ5QbgCmpMXchpkGOYtE5xhHXDaBq3cVC3AdZao45dhBv
         AHN9X88Jpogq/iDBhn4U8r+Tvm+qydcP6ee4ERQJPFAtbX0CY5Z+Znsp5LuTmPcAs23l
         6nfmlOEWeLmZuy2qEk04inuFZZ6gC246U6kgwubbAlHbBDV1Jx2RKObxxAqb4IJdSa5q
         lTv6+ZKL+HjctFbRgyLdkDXsh+ZvoJ3NfnNKc9O6dcaSbpV5KCXdveCVMPSRY21KqhFV
         v0rpztnOWw70n4FKl8J2I+NyGNnPQi4+LoYNgBkA2bSJsoKsL+3wmjLUBKdjDcXqUufB
         uJzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=7yq5zel3pYoHUVqVDNK+W3aJTW3hAZh3wjJZDsT+CY0=;
        fh=y0blsLpqLDYtGN5n7QhlJMANlBXgL/fcL45b9JIY7F0=;
        b=Oc3EQDOUh/eR2THoaw4tdUE9fgtAiKK7YiP22ZmPJXkMPC0o0nELHjKFjiigxgQRnv
         XsEoZSfygxk2o52UO3DdhKKRXM08gUnh0MQMJQJOcvpvM7QEdpsegtXc6k7vA6OD2cdM
         b+8NIo94D5Luk1h+S9F8pjhXnrMSsXG6aHxih9k6d6adwhL5e8/u5sz1JkDpKSguOVd4
         TijY/c5Oa6hOZjlYvhUffiipu/hIJ0IjNqqPIwWZ/ouBFQqG9HbmlcWh6VBqSEwmQEaa
         ApV4Rl/4Y58aHcZGw+JhBoLcoLmbddAB/2cuvjm2O5cH2wppMdDK14yUw5F7s2+9V+ME
         NZDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hRIojK8C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v18-20020a0cdd92000000b0063ce72949bfsi1964790qvk.336.2023.09.01.01.05.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Sep 2023 01:05:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hRIojK8C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qbz9E-0002fd-7p; Fri, 01 Sep 2023 04:04:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qbz9D-0002f8-Ad
 for qemu-arm@nongnu.org; Fri, 01 Sep 2023 04:04:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qbz9A-0006OC-7M
 for qemu-arm@nongnu.org; Fri, 01 Sep 2023 04:04:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693555491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7yq5zel3pYoHUVqVDNK+W3aJTW3hAZh3wjJZDsT+CY0=;
 b=hRIojK8CVClrk/PDII3Xx0E83Q+sHZmjQ5FBLRYuiiO6r+Cr2hrjKFzZdawCCWLKllBDC8
 txryBs739F4wMz1zvFKnxtQIPIxVxv36q0ohtfzSiNmuDXwGVb4mZ01KZy67kOpdpMToyw
 d8tED97F8z/oQ+zakUcs6laC8oiKrFs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-iSOR0XnPO0-XRafdGMtZRQ-1; Fri, 01 Sep 2023 04:04:46 -0400
X-MC-Unique: iSOR0XnPO0-XRafdGMtZRQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D61F185A791;
 Fri,  1 Sep 2023 08:04:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.30])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F0C3B403163;
 Fri,  1 Sep 2023 08:04:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B79EC21E692A; Fri,  1 Sep 2023 10:04:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  qemu-block@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 00/11] (few more) Steps towards enabling -Wshadow
References: <20230831225607.30829-1-philmd@linaro.org>
Date: Fri, 01 Sep 2023 10:04:44 +0200
In-Reply-To: <20230831225607.30829-1-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 1 Sep 2023 00:55:55
 +0200")
Message-ID: <87edjil3oj.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: BPOd6xT5leJR

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> For rational see Markus cover on
> https://lore.kernel.org/qemu-devel/20230831132546.3525721-1-armbru@redhat=
.com/
>
> This series contains few more, my take.
>
> Based-on: <20230831132546.3525721-1-armbru@redhat.com>

Awesome, thanks!


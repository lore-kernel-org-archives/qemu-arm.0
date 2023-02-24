Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1483039ejc;
        Thu, 23 Feb 2023 22:42:14 -0800 (PST)
X-Google-Smtp-Source: AK7set+X7mQg2AP4Ou8ypascvl5BMumYFssdS14zDjOXXysZYmyQBofHYMv9JdXs2t0ib5UmbP6Q
X-Received: by 2002:a2e:a238:0:b0:295:8c03:2ac8 with SMTP id i24-20020a2ea238000000b002958c032ac8mr4566380ljm.42.1677220934839;
        Thu, 23 Feb 2023 22:42:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677220934; cv=none;
        d=google.com; s=arc-20160816;
        b=VY22Ehvk0q+cZP0OgY+e08+y7RvNnSR/9lSnS71wOGgejgJL40SImGo05PmB+eordt
         uLUj3jTOOg7YTc1u+Xva/IS+LfeFrDtMmAa9wWk2MrjKt7/kxtZpi2WleLBXg5gYrwiI
         sV0NNeRdTQ31o360EzGfp+aTInIsP0njBJv++aEMud4OfNQ7g0b946924cS+xWHNqqBm
         f80XlbqkwMkVpygu5e7wUmKQnAa+L+u4uAm6vGvYYpBOlA8I7fMZFjpOCxxDaar0puGv
         yMNSdKYkWnO5bYdpcxctPfdxEGnAXsuaoSgFNJEJCVVX+l3pY9ZnNtdabWzAdCX3N1KK
         c5sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:dkim-signature;
        bh=uzm6Do3ErZ/WacF3LFPYiRGUjjAyteHUQNphpwmEonk=;
        b=vlqh+vNjIqs7zcy1k8Pvz7+jjkwhD2oM2/hEjwn02u3DRzD6n7+ZKaxHeUf5UFUqab
         YhcFPwwFWkkmypiTaquKkyv5gUjPL8VJgak3gLxxOOmWC82HkPeIpqTPOLVCrU+2hU+3
         zVSwSp37W7rVXlwPHssHZHsJSn6buj7ZtWhufIIHjFKsdWL2wusX1VpQbk0ashKlBhsS
         T9quCgwJx/oIDjqRdsL+rPKn5OzP8hKNQoGFVKm6e2VQAnzGepmhJznT44WKZHlUlGoI
         VnOfH7G7kjUR7CSwaH4rJ7xnRm5aG8J0FmVgD/458+mWCKEXWoyOB6fmrCvTOLbZxb3b
         xbVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WT23BKua;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r26-20020a2e995a000000b00295a3a179b1si1222030ljj.387.2023.02.23.22.42.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 22:42:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WT23BKua;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVRm1-0007b6-7s; Fri, 24 Feb 2023 01:41:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pVRlz-0007aQ-T8
 for qemu-arm@nongnu.org; Fri, 24 Feb 2023 01:41:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pVRly-0007D9-CG
 for qemu-arm@nongnu.org; Fri, 24 Feb 2023 01:41:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677220897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uzm6Do3ErZ/WacF3LFPYiRGUjjAyteHUQNphpwmEonk=;
 b=WT23BKua9OnlsGfWbrlfhdVAuRaKXhePOZ7ICLgfDKNv2BD9GHvct55eyX8N35eL65z6/S
 N24X4NAPhCOrLrX2d+VBn7g2P9Mki0AmRqVeieNx7kUf1JY+2B7h9B9Vw/olm721OZ6Z06
 +wwC7/UZskSfaDjkM3ILrQklppmwMIY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-155-70qU7jh1OSqLY1mkkAZ9qQ-1; Fri, 24 Feb 2023 01:41:29 -0500
X-MC-Unique: 70qU7jh1OSqLY1mkkAZ9qQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 16654183B3C6;
 Fri, 24 Feb 2023 06:41:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CFAE451FF;
 Fri, 24 Feb 2023 06:41:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AA9D821E6A1F; Fri, 24 Feb 2023 07:41:27 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-arm@nongnu.org,  qemu-ppc@nongnu.org,  Song Gao
 <gaosong@loongson.cn>,  Xiaojuan Yang <yangxiaojuan@loongson.cn>,  Peter
 Maydell <peter.maydell@linaro.org>,  Greg Kurz <groug@kaod.org>,  David
 Gibson <david@gibson.dropbear.id.au>,  =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@kaod.org>
Subject: Re: [PATCH v4 0/4] target: Restrict 'qapi-commands-machine.h' to
 system emulation
References: <20230223155540.30370-1-philmd@linaro.org>
Date: Fri, 24 Feb 2023 07:41:27 +0100
In-Reply-To: <20230223155540.30370-1-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 23 Feb 2023 16:55:36
 +0100")
Message-ID: <87a61336qw.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: TXYOvwRDZYRK

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> All series reviewed, can patches be picked by corresponding
> maintainers, or should I include them in on of my PRs?
>
> The "qapi-commands-machine.h" header is not generated in user-only
> emulation. This series removes its use in user-emu code by moving
> the QMP code depending on this header into a separate sysemu unit.

Queued.  Thanks!


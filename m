Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2877605ejt;
        Mon, 19 Jun 2023 08:42:41 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6DASk71KsJRJleS1ykHOcwB2U+uNm0BGoiO1XaLVZ04ZXYyoKL6IZp67qaAEroXToeVVF8
X-Received: by 2002:a7b:cbd0:0:b0:3f7:536e:fff3 with SMTP id n16-20020a7bcbd0000000b003f7536efff3mr6970905wmi.25.1687189361467;
        Mon, 19 Jun 2023 08:42:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687189361; cv=none;
        d=google.com; s=arc-20160816;
        b=sFMnjVYy6dpl2vTNkgUgpavdqxTefFR3u8872TdD1DY01lXmqbqyHwLTarr4DT6wnZ
         JeksJiMF4mLJyvJWxJb3T3HOKBVLGC5PlsvwvWBwLEeGVt3kdwp2WaN9c3S2Bh8LfuqW
         bhTgLGGndPM02bCrPBrWqWXALDPLmXUAJbbPCxyqCAMJe+uQM+15d7EhrTBOFOfwQygX
         MCdKggdBUnSUo2FuFvEF/PFffKAr6nnw0m1Ig0m4WCiJzfA1s7M3I7fb1iYuqVl8yBxF
         LtdC7mlShhBIMYf+V5VmB4oORjcnhtg7CE+qvvnWkfKWqkMlD5myphv48q2CjAlDMJDY
         Fuww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=zVejXGWt4jtEY1L56ggG0zyoOAcDrYMTrAoz7F5LVwo=;
        b=jh36dHxS5R18hqFMMesjBX86rgpnliVu1Sp3+7CHYuDtRO4tmrS54WNJK4SAoeSs4M
         BXIjZ5iGzaDKtSnLo/9CKGi611p6OVWrgaiDuBJQ3dEliWkomavuMaLKqudxgsGANL7q
         YaEnALKw/bZ5BhKlLz7lIJPX6Zv8i0bhKwze+HNmuL5zbmzOUgqA/yn5fH8ECeWAN9wq
         MU0yLB8mCK8R3Wz2FFokbk75v6W0lpV3etPs7qRPEzIeaJWiSaqnKFRySka6EWtjOHEV
         mznhs52JdVnLP/AYui4gtPUx4890T/xkubmh5bSHfzw4Kt3ywVR077b+qD772sk+iH2u
         JVtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ILPRLIx5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 2-20020a05600c248200b003f602d8d883si5148wms.218.2023.06.19.08.42.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 08:42:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ILPRLIx5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qBH19-0000t2-WA; Mon, 19 Jun 2023 11:42:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qBH0z-0000rH-5s
 for qemu-devel@nongnu.org; Mon, 19 Jun 2023 11:42:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1qBH0s-0000Mo-0z
 for qemu-devel@nongnu.org; Mon, 19 Jun 2023 11:41:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687189311;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zVejXGWt4jtEY1L56ggG0zyoOAcDrYMTrAoz7F5LVwo=;
 b=ILPRLIx5i4YMNA5Cw0qfLYGyMUJX21GgTFYxDMpgzvW0KNNxDtaE15TIV+y6VC7v5aJwmf
 Y5OeQ8Q7ow1shgOMfUa51Hq/IFJfDA8NJakB/HF8wA2Aw4IzhyX2tuOhJuIIa2J7P4Nenj
 acyt0Aameao0yVTHj27d7id1+7wIXDg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-295-6PicLleYOSWOYx4y5pmWtA-1; Mon, 19 Jun 2023 11:41:46 -0400
X-MC-Unique: 6PicLleYOSWOYx4y5pmWtA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E941429ABA1C;
 Mon, 19 Jun 2023 15:41:45 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.57])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 00E32422B0;
 Mon, 19 Jun 2023 15:41:44 +0000 (UTC)
Date: Mon, 19 Jun 2023 16:41:42 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, ardb@kernel.org, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v2 05/38] crypto/aes: Add constants for ShiftRows,
 InvShiftRows
Message-ID: <ZJB3NmrDfvDl6Pea@redhat.com>
References: <20230609022401.684157-1-richard.henderson@linaro.org>
 <20230609022401.684157-6-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230609022401.684157-6-richard.henderson@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jpjGgECvjcuA

On Thu, Jun 08, 2023 at 07:23:28PM -0700, Richard Henderson wrote:
> These symbols will avoid the indirection through memory
> when fully unrolling some new primitives.
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  crypto/aes.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 48 insertions(+), 2 deletions(-)

Acked-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


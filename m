Received: by 2002:a17:906:3119:b0:a04:79f0:9a0e with SMTP id 25csp134898ejx;
        Tue, 21 Nov 2023 23:14:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXy5VyCUYV52MiattLz+RUjrliUDOIBmArjr/NDUTnQcdIGxSCurmGQZQxknI4kDgxd8eF
X-Received: by 2002:a05:622a:148b:b0:423:78f8:5cf2 with SMTP id t11-20020a05622a148b00b0042378f85cf2mr1889655qtx.23.1700637242612;
        Tue, 21 Nov 2023 23:14:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700637242; cv=none;
        d=google.com; s=arc-20160816;
        b=h1RnbUP96TZaFFszEFnt4sXi7mYH1Ah9lOIXf2XyNbpet6we6kRIABfMU6j56IaRct
         kWw70HgA+s0Ovrgdy/wh2d83umLpGJ+5H0qnmhZ8EEIFJeQxWNo5PxSnqKm+DNV4CacV
         aU0dQwy7pmS/Sy23ota1JPPuB9hoki9hmXpFjEl3bzI2nwpCpnb4PXi5/N4OpfAFDy6g
         yWzs/MSnMRRov0xyFo3LK6RfqTmM3TrFLq9Yx3NnEPAjJrzePP8PSMiyC1/KJDBMmqHb
         pMd/5gK/dgqVajq8XCQQtv5mavSe0nYtbnZfdU2lyaL+k7rfqnWP48kLG8MYnR+/FQwN
         Q4DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:in-reply-to:references:user-agent:subject
         :cc:to:from:date:dkim-signature;
        bh=C0Gvttm2BT17r/rQ2eWa4G9Pd6giBQyDkIRVvpo/ReM=;
        fh=UJNoRMXvawh+Nz90wsqCB4hLiJ339wMcpkkSd2G8ai0=;
        b=D/NdskQWeVskbrvl9Y/Ch9ag8eU0U0ICEj5eRAIYW6DWd6ysN2JagUsk27OpnwiJ99
         /2bkKuzJ757QGREjfLlDj1cl9ODwZzoscPf84ENDf6F2kiD3Gu9r06kPKsaiIMYo8Lg+
         K8Y7+WJ56nfRaa+epRb84jX91fH2uri7QhqMDwLNsmY165AapwNZnS3bVDZeoUTjSt9M
         OixJ5CfRBG8PopxFRNnOwMSj0fsBn0Z5jnmO9uH933E99uSLxacS9BIRzGJiAJIU94Cc
         yt6V+VECTZ5ZtmvCeZMUS2Hkk4+g6cVrIwOZmY30ocV/eWeRfbE/QPCcRFdoAhRn6811
         Gd7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kf+aFrJS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ck8-20020a05622a230800b00423776022a2si1592127qtb.238.2023.11.21.23.14.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Nov 2023 23:14:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kf+aFrJS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r5hQV-0005tb-WB; Wed, 22 Nov 2023 02:13:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1r5hQU-0005si-Oz
 for qemu-arm@nongnu.org; Wed, 22 Nov 2023 02:13:34 -0500
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1r5hQT-0007A8-9K
 for qemu-arm@nongnu.org; Wed, 22 Nov 2023 02:13:34 -0500
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-507c5249d55so9418394e87.3
 for <qemu-arm@nongnu.org>; Tue, 21 Nov 2023 23:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700637211; x=1701242011; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=C0Gvttm2BT17r/rQ2eWa4G9Pd6giBQyDkIRVvpo/ReM=;
 b=kf+aFrJSLE4UvFS7xcbUpR34xlV5bqqY/jh0bwuv9oo0OLFiKi6lxPBrdO1R8zZcJI
 pk4NOuccGZLkmp1sklPuISI+LgcrVvg1JH4boIXCENGYB0zk8WCWJ53f1N13wXxi/qZe
 az9eqH/PKB4uPZq8fg0BMDoO+h6HhaZdJObpt4j26HaQK0BkDZWvcqXUaty8mkRccr2r
 QzcAJmS/vo5hT2fkKraEk0zQYEImuoiof3bE8Jtb0dybCNiMZd8jlps7NeXQcnpNKsDE
 b3mrQIjrhJrbfiLSjOvQ9EH/kyfeKaC+J4kt0RkQeJCQilWT1A+L3TG08fwnQX9jyoiT
 tRyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700637211; x=1701242011;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C0Gvttm2BT17r/rQ2eWa4G9Pd6giBQyDkIRVvpo/ReM=;
 b=I9vCAMINCGkLRQH0PCaVxLUM7qkjyiGuhe55gDvntZcdCd/JJsOsanRVFoYP+ZaYw/
 FIhqLQUPwmqt2SI9BFljgeST2MSGBLDsJZaooTbHL9f8gQvqZuEujKbeZ12UWd0RLqon
 6dWy0/wK+7wyePiRR/a6jZD+ISbDazH0UUESub/qBalEo+ElimoUqdNTPfBZyvOrSY4G
 NwnlEQ0DnZkxyJ+Mj3Y7/1cmLEWNcUpuhTHPwCf3T+XTMhhskrOgAgAtVJkzEz11dmk6
 wZJKOPcFcb6/kGvzJ9+PpGeRTvEH17IktUgcrN2B40trGf/PxvMgEkJ62ROd/c1pU4fK
 7XeA==
X-Gm-Message-State: AOJu0YxAQHlHMCeM62zi3CksgEfMlRVLOFkR2TCghTp3ljfUh7sTgvAu
 XmCCR0c2b48S8u/9sUKGQfy8sQ==
X-Received: by 2002:a2e:b3c9:0:b0:2c8:71c5:d6cc with SMTP id
 j9-20020a2eb3c9000000b002c871c5d6ccmr993141lje.32.1700637211359; 
 Tue, 21 Nov 2023 23:13:31 -0800 (PST)
Received: from meli.delivery (adsl-195.37.6.2.tellas.gr. [37.6.2.195])
 by smtp.gmail.com with ESMTPSA id
 o13-20020a05600c4fcd00b004094e565e71sm1161180wmq.23.2023.11.21.23.13.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 23:13:31 -0800 (PST)
Date: Wed, 22 Nov 2023 09:11:05 +0200
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org,
 Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>
Cc: David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 C=?UTF-8?B?w6k=?= dric Le Goater <clg@kaod.org>,
 Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>
Bcc: 
Subject: Re: [PATCH-for-9.0 15/25] backends: Simplify
 host_memory_backend_memory_complete()
User-Agent: meli 0.8.2
References: <20231120213301.24349-1-philmd@linaro.org>
 <20231120213301.24349-16-philmd@linaro.org>
In-Reply-To: <20231120213301.24349-16-philmd@linaro.org>
Message-ID: <4ik2g.hrc8nvnm8q7a@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: dk+0iPVAc84R

On Mon, 20 Nov 2023 23:32, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>Return early if bc->alloc is NULL. De-indent the if() ladder.
>
>Note, this avoids a pointless call to error_propagate() with
>errp=NULL at the 'out:' label.
>
>Change trivial when reviewed with 'git-diff --ignore-all-space'.
>
>Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>


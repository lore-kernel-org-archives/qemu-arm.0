Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp702926ejb;
        Sun, 29 Jan 2023 20:47:43 -0800 (PST)
X-Google-Smtp-Source: AK7set8b5T5BtrhEKdeZrMsNXGcmVSFBR3roZB4WSRDpVJWj5OsSPjIutt/y1aAyNRYaxr1jOTfW
X-Received: by 2002:a05:6214:b01:b0:538:2ccc:563d with SMTP id u1-20020a0562140b0100b005382ccc563dmr15898224qvj.17.1675054063623;
        Sun, 29 Jan 2023 20:47:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675054063; cv=none;
        d=google.com; s=arc-20160816;
        b=vI+7yduAW1JuBafKrJLuDaV0ByS8FvomgePYg1ZN0DfViTuuSPb5MHxWh/ZWdZZqSU
         U6V5HziPyLM6a9bbqrnAiV6XYMwZf5mw0wfJEHiwqGr5TZCngPqh1tSsSD/O24e2F/YG
         ZyJga+9GFCeTEnlsKj6sYTbXigqEB9lQ3D6rLESzg+HsFmCH4rtDWAtc8znhE9mNsKDQ
         UFxKDjKzsuWCcAEb6NNSXk9rQ3v5lI3FKnLq4YAw9osZ5MUUlK3a+78LbJ4L0IGe/c/I
         ymNor7wzlziBaV2Lkv433okp+ch5GmRb5BsJPmVYpkY+julXX0DmjCeUTR8aeU+l+k53
         c23g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:dkim-signature;
        bh=o0mqG1HcqWmINKor7Wnax03MkI70dAL8imabKt5Un+g=;
        b=HM3ZaFrcddFScYv36neeXhaLcQynkh87X+rMQlmZfsNipgJRFXv6WEMlhyL3bnn1Zf
         HMqFPrqIVVmjulVNQD8bZ61TnczMV9QxVZ8b/I4ZS2Ty3wOQiXkG2to7QcTME8ntfak3
         ZJMKPHPr6wTW6nAevj+SRRzYW9Dy6shDckM3ySpxjUdaip8dmr1QPuq1yr2dxg5J8PBa
         5fUQZLETaq71GlGBx3LbTZTwkbmDNP1KieB4Ok2Wex6IwvP0fLR4KfoQYBWSDMD/lBfA
         JZi8xZhnUo3C5WF6hMG77nWc0rjcUb73p9HxrcKDMtWyNiyClF9zlPamVwfME0HAAA51
         1WgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ITfsKLmH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o10-20020a056214108a00b00531c37bb82dsi5923506qvr.470.2023.01.29.20.47.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 29 Jan 2023 20:47:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ITfsKLmH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pMM4j-0004Av-29; Sun, 29 Jan 2023 23:47:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMM4h-0004AS-IT
 for qemu-arm@nongnu.org; Sun, 29 Jan 2023 23:47:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMM4g-0006EO-AJ
 for qemu-arm@nongnu.org; Sun, 29 Jan 2023 23:47:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675054041;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o0mqG1HcqWmINKor7Wnax03MkI70dAL8imabKt5Un+g=;
 b=ITfsKLmHg4/NaTVAjhf/QA+B+8f8s/oVGVeP8CC47bvJYCo9YvRbLhZAmrR958oFCN/e7E
 rHjJMKxQI2or58UYn1aoGvefGNC6RG06Z0McvG6O5wZFYZRMiCLfGbvVuHWCcGzXsQeWBG
 0ZoVV9C9OfuJWl+XcCPSZOe2U6Bm6p4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-596-nLbykHM2PxqkEFCj9HinUw-1; Sun, 29 Jan 2023 23:47:19 -0500
X-MC-Unique: nLbykHM2PxqkEFCj9HinUw-1
Received: by mail-wm1-f71.google.com with SMTP id
 iz20-20020a05600c555400b003dc53fcc88fso1395156wmb.2
 for <qemu-arm@nongnu.org>; Sun, 29 Jan 2023 20:47:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o0mqG1HcqWmINKor7Wnax03MkI70dAL8imabKt5Un+g=;
 b=mYOsc2WAngWw0TV6SQ7uMRLMHvNp1bYrxNvX7FzQETZNhM6xoAIIOG8zOFJ9l9c4MI
 +VvN6Q17jDL1ZOh18/QyIT4LwNj1GhZBz2qZi4GGbOhMRM75Uu+CMZzglvmeUxsjMncg
 E0mtC3O0QonM1T6zJwNohC5/stAQ87GqaqPWf6tg75tYoTMwQgNACBzg8tSDkB5aSSqm
 VS3u6uHohWYJPFPh2DiuH2UihnT4h6Oqc/rH21JDONc5A5vbOdXmSIgcsH7BHHNOxVu7
 14lve/FyR/p/B4yQl6BML4gD+0qPGiDOAa97ekU8el5lajerKztbT2QaFKPwOm8cT5xg
 dCyA==
X-Gm-Message-State: AFqh2kodCFtKA16jY+a2FIsNDoXsLvHCCM3+IPrZ8UiXV46GzZpHaf3k
 wF6GjXkqIJqvvpltJ7kD7nN04uxFxFtU0/f5YKci82VG2oEnVy5CUgS/MWVBC3pDAqcoGzOJjys
 GHHJEaArpMoSX
X-Received: by 2002:a1c:6a10:0:b0:3da:f665:5b66 with SMTP id
 f16-20020a1c6a10000000b003daf6655b66mr51195854wmc.6.1675054038852; 
 Sun, 29 Jan 2023 20:47:18 -0800 (PST)
X-Received: by 2002:a1c:6a10:0:b0:3da:f665:5b66 with SMTP id
 f16-20020a1c6a10000000b003daf6655b66mr51195842wmc.6.1675054038598; 
 Sun, 29 Jan 2023 20:47:18 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 u14-20020a5d434e000000b002bfbda53b98sm10578037wrr.35.2023.01.29.20.47.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 20:47:17 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>,  Thomas Huth <thuth@redhat.com>,
 Fabiano Rosas <farosas@suse.de>,  Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org,  Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 09/11] tests/qtest/migration-test: Build command line
 using GString API (3/4)
In-Reply-To: <20230120082341.59913-10-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 20 Jan 2023 09:23:39
 +0100")
References: <20230120082341.59913-1-philmd@linaro.org>
 <20230120082341.59913-10-philmd@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 30 Jan 2023 05:47:17 +0100
Message-ID: <87wn54ljca.fsf@secure.mitica>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: FRrhkbQVzr96

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:
> Part 3/4: Convert accelerator options.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>


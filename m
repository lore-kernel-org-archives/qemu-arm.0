Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B1C5CCA471
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Oct 2025 20:55:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4mnt-0007ZJ-8I; Fri, 03 Oct 2025 16:55:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v4mnr-0007Ys-4k
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 16:54:59 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v4mni-0003KE-Nb
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 16:54:58 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3ee12807d97so2182243f8f.0
 for <qemu-arm@nongnu.org>; Fri, 03 Oct 2025 13:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759524887; x=1760129687; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=B3ldZEG5ScHR939V5D30GdFiXHB1AdjnHpqkcb2Cno8=;
 b=QQNaZNydv6Ij8R4OSDYuQSc7H4pfrHCbfZDkVhqY8bjf+0aGT8FX6nmG8K+WRbk2hI
 5334/t90W5bRmAzW2F3ZbthMnu8j1w1yvQT7qTFnnQcVMsBFjTwkz8UV+mmCYL+4gilE
 XOsdra5bzzYpOdqhP6Modvc6TzPbE85p5SP5XvAEPbPnB55ym5U5oUj65hp7LqWHphja
 jeTsJr6JrO4qCO+hKXHu5Xma3uuWSQMAK0adePq7seubk2wcpzEqUS3Nx05gMZyahQrr
 gXztD5E7O4OusWjippfT7YrLvJ8u+J/g5RnSVenXQxQQIx04dH9T29NLSRBbqcb8DfUE
 2wfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759524887; x=1760129687;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B3ldZEG5ScHR939V5D30GdFiXHB1AdjnHpqkcb2Cno8=;
 b=WYefrrp/eOTxujaERsr2uBJokShhmqIsj1m1CDefBybECTKUgMxmf5Ao693K+IIqLb
 +14yLQicyu3TbTlYoB/Mmew3eWw8/ymVssSQ6JfzMNOrjeAWeEq+urLYNQLFX/uqk+MR
 9415sHpeEYXm5kc4sZ1dqXjPfw0Z36JUrQkAcWwdWoueP8LL5bA6mYpihufUebpyMfjD
 fXfRY+dPJC8pdZic/eCUwPzlpjc7qDtGpwTHPN9LahQB55deL1idctJHBKwnc5xBnOVx
 uZBLDI+DoR4AJ7uLWIj1JvDcX67/JocwQCWl5JPrL3kSHOlxiilSbvYSBt+jLWNCEg1S
 UcEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNALVSBj58lLkkhn87YXSDORU6gZxtgHUVKYcGfEwpqLwmsmPvzipbgkxVVzqrRoSnZvPDIBbphw==@nongnu.org
X-Gm-Message-State: AOJu0YygdvORfsaNAUMx/ygLy7nb/IVDYTLQBXUfpyzKoWFP9clxBBYY
 4MvNfZQx/pDwDjMDWNuqkHN9fegBWRTxSc5dJYzYiF0Q7tl1eF4WVl+eg/sWPUCSZmE=
X-Gm-Gg: ASbGnctk8RpurqU/ctrh+rcN55wlaje075OI5uyvREMrj6j4hQ+HbkrPcM5pwsxw+Qk
 uWEvKlZtncOhDoA7xms61ZJF/timaiSKyxaNz9d/a3GodbFxNuwA2Vzz2hj4IiSqIlUvzfyUjSN
 7qvTerJh7BzDxfKvPAEl/7xp4JlJCEz9aTh1CVUTlmjwLgup/+0vAEw2RDmGeSnbg/wJ5nS/Ptz
 mHegHUhEVRft6KFom1edsEcXxOrlraNOwcvOmTHw2fnWtI4gTqRaaQ/VR56Cveg81iJiTyaA0F0
 M9c/k22552KGZigTd+vmslDz1Y0vbGHxXTH60A3phhTdZ99hb4WiK2mh6GgnQxHHRmUdTznA3Nd
 gVsMovzbXiDQVRFUhbWb6GlwUBO4I20t1i+xVj3KBiPBydPEsB5b0suk7APPSnyBvhJyApuZx6K
 f2Z+3VLvI1yMI9/08iNAQLs1jfHlIE
X-Google-Smtp-Source: AGHT+IF+YPiwwY9HDDgxpirJo38iH44mnenhG9cCLyC/enTPjWl/okcrtohvYzGU+mmB/W8I/zANPw==
X-Received: by 2002:a5d:64e7:0:b0:3eb:c276:a347 with SMTP id
 ffacd0b85a97d-42566dff020mr2934384f8f.0.1759524887386; 
 Fri, 03 Oct 2025 13:54:47 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e61a0204fsm146130205e9.14.2025.10.03.13.54.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Oct 2025 13:54:46 -0700 (PDT)
Message-ID: <bacd25d5-fef8-46ca-9f8a-8edcd48e85d2@linaro.org>
Date: Fri, 3 Oct 2025 22:54:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/18] system/physmem: Extract API out of
 'system/ram_addr.h' header
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-ppc@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Jason Herne <jjherne@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, kvm@vger.kernel.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Fabiano Rosas <farosas@suse.de>,
 Eric Farman <farman@linux.ibm.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, David Hildenbrand <david@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>
References: <20251001175448.18933-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251001175448.18933-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 1/10/25 19:54, Philippe Mathieu-Daudé wrote:

> Philippe Mathieu-Daudé (18):
>    system/ram_addr: Remove unnecessary 'exec/cpu-common.h' header
>    accel/kvm: Include missing 'exec/target_page.h' header
>    hw/s390x/s390-stattrib: Include missing 'exec/target_page.h' header
>    hw/vfio/listener: Include missing 'exec/target_page.h' header
>    target/arm/tcg/mte: Include missing 'exec/target_page.h' header
>    hw: Remove unnecessary 'system/ram_addr.h' header
>    system/physmem: Un-inline cpu_physical_memory_get_dirty_flag()
>    system/physmem: Un-inline cpu_physical_memory_is_clean()
>    system/physmem: Un-inline cpu_physical_memory_range_includes_clean()
>    system/physmem: Un-inline cpu_physical_memory_set_dirty_flag()
>    system/physmem: Un-inline cpu_physical_memory_set_dirty_range()
>    system/physmem: Remove _WIN32 #ifdef'ry
>    system/physmem: Un-inline cpu_physical_memory_set_dirty_lebitmap()
>    system/physmem: Un-inline cpu_physical_memory_dirty_bits_cleared()
>    system/physmem: Reduce cpu_physical_memory_clear_dirty_range() scope
>    system/physmem: Reduce cpu_physical_memory_sync_dirty_bitmap() scope
>    system/physmem: Drop 'cpu_' prefix in Physical Memory API
>    system/physmem: Extract API out of 'system/ram_addr.h' header

Series queued, thanks.


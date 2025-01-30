Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp46925njb;
        Thu, 30 Jan 2025 13:40:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU3umdbqVoV08UpLOm0D19AjRKRNQFT5yNfSR1f4zuYL+12iFpQGchKrILAKaLsUSxSGI6euEZ/ZNniPw==@linaro.org
X-Google-Smtp-Source: AGHT+IH8IubNXguAd/YfeBSyXbPLBS7iHQWuqrhHGTI/oS0bINFrnZV6vdl9hfpKKl87OwXeV5q8
X-Received: by 2002:ac8:594d:0:b0:467:63a5:fb9c with SMTP id d75a77b69052e-46fd0b90e65mr122225291cf.44.1738273252401;
        Thu, 30 Jan 2025 13:40:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738273252; cv=none;
        d=google.com; s=arc-20240605;
        b=QhdyRpaXAB8pheAS5yS+7KvbJ7+7avjHV/QJ0/S/8LSXquFJWt93YNnBIufQwWimDe
         CMXYE+IZVksJhl8fowKhfJxJXsdUP1dpTdU5sOp/8Vwjs3lXK5/i4q0qw2QHz5VMs3Fr
         bD4LqQrbEFwdHZQpt5kAC2W+pcxl2d0pWcidX0x86EUxGq4oQ3QC+Vs5FsxofkUbePvs
         AOJw4r3it+SjHXNG0/ggI/yYe1eS5bL2559fBEmmCiwpJvlOpIGhQFCoOoLwA6Drmk0P
         NdmKKnhb4a4T/06zWWbMFUdIImyb2V6+ZAkTcjpDeqFcxlR5ZSrNm1Ijj+uCtxPm30I/
         HHXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Fomha6UOHnqjUpN5e8RHj8i0NspAm/QVvEPupC/Ks5o=;
        fh=o1o8FiGKwtVCJO41W9IuEbPpurHIDnFhrY7rH/y/1Fk=;
        b=HfZxvJsZGgmCSxNTOJmHC/OPJxycKNQI952F62uuavGzGWyY5CHPNpaa6VrlaSqsEi
         xhLmu6f6bZCDg5VHBBVlXd21rJRaaLkZiEevSipFIJ6UhmUt/0VQyZfbN7i+NOTmQNsG
         CH+WsrTJpq3Th8PS4OphEWRkt+dzRg7cpkNngt8Yc11Flb1yExd3eR3svRYoVGx3IyQD
         zacHQ6KV0cV5WNtkKhGI5Db6K9QsuaY97Dp4UchZL8kWz1pJjWr1f+nVXKMmfLD6aazo
         8x++02xnNAmI9lmOuUwiJ6WPs5PGcxzCs/qxR4qkpTC7nDsf/rL9wo0baLuLjspaKUhL
         ieMg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XgcMUOd8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46fdf1d18d0si24383161cf.378.2025.01.30.13.40.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jan 2025 13:40:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XgcMUOd8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tdcGw-0000bL-Rd; Thu, 30 Jan 2025 16:40:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tdcGs-0000aT-SH
 for qemu-arm@nongnu.org; Thu, 30 Jan 2025 16:40:22 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tdcGr-0007sC-8D
 for qemu-arm@nongnu.org; Thu, 30 Jan 2025 16:40:22 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43618283dedso13454805e9.3
 for <qemu-arm@nongnu.org>; Thu, 30 Jan 2025 13:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738273218; x=1738878018; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Fomha6UOHnqjUpN5e8RHj8i0NspAm/QVvEPupC/Ks5o=;
 b=XgcMUOd8tThenCQwop3uqmU78UQvqJbaZdzRq4JK/NBptD6vb5eHe4fspytrIJV+4u
 gd2V4ILkEPnZDFVhllB9wvVv2DmF5CBsjxAI/C9zCdrrAujagPh6Hv14zTjP+1ONch+j
 kFdVeBAWJxnoK3g96kYJrlX3up0+jWqzkmWR0ABFYF0nCcCjw63Q6SuV4765f573NZuT
 KubykkxB1VgfjWHT1kKNJrrQ6jlyFiuDJHKlF7XKWp+Ap6c3TzpeA7aX2fU9e3vvjXrJ
 KWwx9tqvezB3VjU5Zn/Z624vBpgmT3xljQuuudapfBqDDEJimjuGJ32bBVc7u3who3Qy
 OuPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738273218; x=1738878018;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Fomha6UOHnqjUpN5e8RHj8i0NspAm/QVvEPupC/Ks5o=;
 b=KuJyHHiOK4Z48PvWMj+ATJ5UX5QMTHlVq3tl+HgRdx89mzgC1RJHQoAaQzIvt+5VvP
 OzVD7hJneknvqFf8+on2f+bi+cDgar6uNHrjquHgVH7ZD0Gd+M8yxaYXsNio3Hrbl/GV
 xpySqtvzLr9NSBnfcVu2+5H9swXFsXSujRyM3z9h8xMj67GDtkMgMSpwZh5S8zapc5Wj
 NLQ40jiKyUiD86DoLNAsZz4bcqFbW+oun5/f54CIQipTzDUTrtilABbyptLh8BoQUf3V
 xOpf5sDtWvhFhfLs7FXXI/ugJ85rz0Sp+GhTV8Xsn3WnKjpEivGVpQkG9fP2pd95E11/
 EETw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbgLGQh3EPkAVLJ8nkeMPFBSDOnDv5RMDbbK4fGCuh08YJoiEdKhbpZarKxgiIIEQv4t+bnV+4aw==@nongnu.org
X-Gm-Message-State: AOJu0YwyWMPjAFSM+ceHZC55Qj9dlCg0cinFkhly4QNwNsCHdrjGeF8v
 iC6LUmT5O9oVmh9FB1RvTDhDBRHmFxDtyKyHO4wxgnPMWFTiZVfYQVH5zcGbrqQ=
X-Gm-Gg: ASbGncueLNNERCAByq65z4+6Fz4h3g+wmg6FeDktwuY0jdn3MZXUMAYj4WW83fAznqT
 rdEr4hT8vxfZ6qMyB0A2SQ5jmye4IfKDVRTv7GHgefVv5IR41m2kU6KYEEsoWciat7GIwHFc89+
 4tKJ83g/zpobITralqcTIastN1/ENYUeU8RiqcBB4PCJnDOmI8lM2G201ORfPtJxZXDzqyjY3+u
 VFlx6q6kkmiA8I7tw3E1dej3u2RgmQ59b9lSs3JAOFA6l1LxIQ2t8a1AGg63K9XXEhhkbCuZTPe
 9kMHaph6mKFvA8nn7x6oK4PKnH/p8bX/g8swz7arz89Vp7oYvZuJ2yXZOpg=
X-Received: by 2002:a05:6000:1f8b:b0:386:407c:40b9 with SMTP id
 ffacd0b85a97d-38c5195dd35mr8041825f8f.28.1738273218516; 
 Thu, 30 Jan 2025 13:40:18 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1b576csm3081576f8f.63.2025.01.30.13.40.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 13:40:18 -0800 (PST)
Message-ID: <25300fda-9d87-4cac-8b68-19d0cc5890ef@linaro.org>
Date: Thu, 30 Jan 2025 22:40:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] hw/loader: Pass ELFDATA endian order argument to
 load_elf()
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20250127113824.50177-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250127113824.50177-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: V+XDyT+Pm0T8

On 27/1/25 12:38, Philippe Mathieu-Daudé wrote:

> Philippe Mathieu-Daudé (6):
>    hw/avr/boot: Replace load_elf_ram_sym() -> load_elf_as()
>    hw/loader: Remove unused load_elf_ram()
>    hw/loader: Clarify local variable name in load_elf_ram_sym()

Thanks, series queued squashing:

-- >8--

diff --git a/hw/core/loader.c b/hw/core/loader.c
index 8afb2d6cf35..fd25c5e01bd 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -445,3 +445,4 @@ ssize_t load_elf_ram_sym(const char *filename,
  {
-    int fd, host_data_order, must_swab;
+    const int host_data_order = HOST_BIG_ENDIAN ? ELFDATA2MSB : 
ELFDATA2LSB;
+    int fd, must_swab;
      ssize_t ret = ELF_LOAD_FAILED;
@@ -469,7 +470,2 @@ ssize_t load_elf_ram_sym(const char *filename,

-#if HOST_BIG_ENDIAN
-    host_data_order = ELFDATA2MSB;
-#else
-    host_data_order = ELFDATA2LSB;
-#endif
      must_swab = host_data_order != e_ident[EI_DATA];
---

>    hw/loader: Pass ELFDATA endian order argument to load_elf_ram_sym()
>    hw/loader: Pass ELFDATA endian order argument to load_elf_as()
>    hw/loader: Pass ELFDATA endian order argument to load_elf()


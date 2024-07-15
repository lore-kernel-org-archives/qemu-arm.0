Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp2118075nji;
        Mon, 15 Jul 2024 01:45:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX7f8kLlEDPlQKOwxJzAtDvl/0BAHgBiHd9CIq1Z/h0rZF7O76DgW01HtnSWqDI3Y4A55EK1540n20RaFiym7ZMr9TbziFs
X-Received: by 2002:a81:c30c:0:b0:65f:dfd9:b23d with SMTP id 00721157ae682-65fdfd9b701mr61285257b3.17.1721033144670;
        Mon, 15 Jul 2024 01:45:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721033144; cv=none;
        d=google.com; s=arc-20160816;
        b=iiqFQ2DvxG/sd0fjRGovUHSKrQbkyoHUt+bg6fJwBRF2QOTvsE+1NvvzYgzAVYr3UA
         1yqQ7Z5+osDq9IeAJqSKrDsfPa4W1R4alFjOibz4itKV2qjoav41Uqsvl30xRR/gUO2W
         Es/vwxl2BrqGpGAmAd72WxoEk523z34Eo3Kk0vizyKAxrjXaDYCHaOwgUM8RyO9Km/wG
         zdZMxzwjjt+ggky3XpbTWkJMWhk3XWlU8zrDnpg9JaSoYhPtqnYtXHZIb87G9poDPj0t
         oUap69gZH49BXfmOIn5QXzmNB8C4vqaICo5AhZWV/ra9LYJnt5aQ/x6aao95z7ZMxp3D
         JoWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:dkim-signature;
        bh=WmRB0IiiVcJoW8Guf+AR/DDBZ7QNZLi0NBcwnWdsC5U=;
        fh=txqZfqlbTQNwaTz7UGpBSWXIIQLUGu/jJHocq3pI/yM=;
        b=wch1xvXjGENt3FQxYL/m/QmvLeOgCQ3J02NJl8FpL8Ss++fdxwvQBuDLX7AiqoIXLP
         IiiVOEKpxQynShaY0Ofw4rNyitnI/pUxjGf9SvfuB9yXj8YQt6JdeTYxe5wF6TTPxKjg
         5QDCW5vbZMsRQZ7cDPdOelKOEt5V63w+PyQZzct0gFhSYkhRR3CAKsQLRmHYT7JhKqv/
         SWIzVPjroK6Tk1d3/G2EFwy5jHZQSTCowacORMGPEwjhxtwtWzxoMqx+/6pdRKvXTZhb
         PEMKtv6ack472uvekRusNaNHzBgzOqjmCU/EXtB9Mbf3a03GFFWR7ICX7uzoAROM96tZ
         RfGA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Fhl9CV3t;
       spf=pass (google.com: domain of 3uoguzggkcws3xz34lqlrzzrwp.nzxlwp8.mpyyppwtyl2z.z2r@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3uOGUZggKCws3xz34lqlrzzrwp.nzxlwp8.mpyyppwtyl2z.z2r@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3uOGUZggKCws3xz34lqlrzzrwp.nzxlwp8.mpyyppwtyl2z.z2r@flex--smostafa.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id 00721157ae682-65fc4a2318fsor25989457b3.13.2024.07.15.01.45.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 15 Jul 2024 01:45:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of 3uoguzggkcws3xz34lqlrzzrwp.nzxlwp8.mpyyppwtyl2z.z2r@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=Fhl9CV3t;
       spf=pass (google.com: domain of 3uoguzggkcws3xz34lqlrzzrwp.nzxlwp8.mpyyppwtyl2z.z2r@flex--smostafa.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3uOGUZggKCws3xz34lqlrzzrwp.nzxlwp8.mpyyppwtyl2z.z2r@flex--smostafa.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721033144; x=1721637944; darn=linaro.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WmRB0IiiVcJoW8Guf+AR/DDBZ7QNZLi0NBcwnWdsC5U=;
        b=Fhl9CV3t2QlmxqV2qTAvVOHqTI2tsGacFAohoBqPbkMbEhvTcxHmIpO+S1/AvvNscF
         DFfbcBkFQvHua0u+d1zvA0t5NfYzorK8t0cjzJ+gcpQLaoH+8EMYu9w0V/bxkVPs1+Vc
         Sr2WT6Q2vngEwSlX39ixT1EvoR+NGGKgCDrZJtUl67Kr8/d2Ps7ZzHi7Us/yaAcBfRBD
         HWcBngyR24ckbNiQkhxFBeB9ZrF0btiR93MAtg70lPxzDjajfbHaBfDoFxlJ6pJRDdcN
         nfFjxaOW+X5m5e9mjDDQ/fe/p8wWApENr57ANkU8AgtKCI0nRszJHk5F+kz7mFF+Q6K4
         RvDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721033144; x=1721637944;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WmRB0IiiVcJoW8Guf+AR/DDBZ7QNZLi0NBcwnWdsC5U=;
        b=cJ3ttpfxn+hufdV+W6liNVoCAvUkJ1E0vvK5oEp85137JMZu+y16N+2LJjVIcIivbQ
         6MAIczs19/J/YrqI9x5+6Qmr2tPmlTrAF63xp3gM0Zw3MvQxhO2cJrdGQOP7zHBsMFwb
         xPj2W6RxB/gfdfuoY+rgV/sxuMYWULMshpwBM9a/9jEqjAl8ddYR/RZIxph30N7n3lKl
         FgtaGcgTwKTkfl0fYO2guL8J3yyGuFPgcS0GMNONiQGIGbnnP/f/pWLWsYJFmEuhtq+N
         Vh9whaAfxazzYbtCWb2DUA+2yeemXYisysPyEQfwYBbsJlIcguADwdIt2LNmeYdEk0Tg
         uOKQ==
X-Forwarded-Encrypted: i=1; AJvYcCX26+/n2z9Ad3Uci3VM7OPxF2HiK8TwMt8nabDVSH5wh1voCaPl8KrW451CD4YgF0+0aBaw/TMrOxqmGM7RMQA0bLkbl5LQ
X-Gm-Message-State: AOJu0YyhUChLScLrAMrwwRjCVxHCKU9BC5s/ftyMujSvgcP/qqzFNee3
	LjCRvlQ88jUiv9DB12/Rl9LLBbGXNN+4beKDqtaCv/R8hb9fZGM50il+5vjOxOnfW/37zhVmjFf
	/RLbYzrqMmw==
X-Google-Smtp-Source: AGHT+IHkY4joZxpPBoOYPle6hjTkrZ50f80+fxDiFkYAo99eo4IbOOArX65KLgtOhVNn4L0NzOkMFVrx0fwQvg==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:690c:64c1:b0:62c:ff73:83f with SMTP
 id 00721157ae682-658f04e8ddcmr2119357b3.8.1721033144191; Mon, 15 Jul 2024
 01:45:44 -0700 (PDT)
Date: Mon, 15 Jul 2024 08:45:07 +0000
In-Reply-To: <20240715084519.1189624-1-smostafa@google.com>
Mime-Version: 1.0
References: <20240715084519.1189624-1-smostafa@google.com>
X-Mailer: git-send-email 2.45.2.993.g49e7a77208-goog
Message-ID: <20240715084519.1189624-8-smostafa@google.com>
Subject: [PATCH v5 07/18] hw/arm/smmu: Introduce CACHED_ENTRY_TO_ADDR
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
	qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
	nicolinc@nvidia.com, julien@xen.org, richard.henderson@linaro.org, 
	marcin.juszkiewicz@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: SfX5ccNSpAhT

Soon, smmuv3_do_translate() will be used to translate the CD and the
TTBx, instead of re-writting the same logic to convert the returned
cached entry to an address, add a new macro CACHED_ENTRY_TO_ADDR.

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmuv3.c              | 3 +--
 include/hw/arm/smmu-common.h | 3 +++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 11cd12e32f..3f2dfada44 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -951,8 +951,7 @@ epilogue:
     switch (status) {
     case SMMU_TRANS_SUCCESS:
         entry.perm = cached_entry->entry.perm;
-        entry.translated_addr = cached_entry->entry.translated_addr +
-                                    (addr & cached_entry->entry.addr_mask);
+        entry.translated_addr = CACHED_ENTRY_TO_ADDR(cached_entry, addr);
         entry.addr_mask = cached_entry->entry.addr_mask;
         trace_smmuv3_translate_success(mr->parent_obj.name, sid, addr,
                                        entry.translated_addr, entry.perm,
diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
index 96eb017e50..eecbebaaac 100644
--- a/include/hw/arm/smmu-common.h
+++ b/include/hw/arm/smmu-common.h
@@ -37,6 +37,9 @@
 #define VMSA_IDXMSK(isz, strd, lvl)         ((1ULL << \
                                              VMSA_BIT_LVL(isz, strd, lvl)) - 1)
 
+#define CACHED_ENTRY_TO_ADDR(ent, addr)      ((ent)->entry.translated_addr + \
+                                             ((addr) & (ent)->entry.addr_mask))
+
 /*
  * Page table walk error types
  */
-- 
2.45.2.993.g49e7a77208-goog

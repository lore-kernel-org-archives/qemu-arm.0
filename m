Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp1922419ejs;
        Thu, 11 Jan 2024 11:25:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwhvq7DkYFjbelU9j78kQ7fR+jJM4ELcwNNJyhEEm7gFR45KhGzOkNEAAxQZaWGIM3faEv
X-Received: by 2002:a05:620a:204c:b0:783:1b8d:d3b5 with SMTP id d12-20020a05620a204c00b007831b8dd3b5mr271744qka.132.1705001145783;
        Thu, 11 Jan 2024 11:25:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705001145; cv=none;
        d=google.com; s=arc-20160816;
        b=NF97+r6i4ZQzuCSqzb9XuQcq1nUFkfmSWz4TJ5BL0zQScsovUIvMHdS+f9N7ib3V1Y
         bRIeN/tWaO0NddCpCiDxdmobWMkph64s22evQOG+60xrGlN1CdexSy5xHrTUbBihGar6
         NWZYfDol/bohvH7/XlzNWDQ+NAqngp30Sb3Rys3K+acudrsEVhMxdNuRgB5uMiQV/CBO
         iI8jGXSuUD6f26cI0Oo6i5HWLbI2AcnqeauaVuPh7o5OMDRybUCL+EL6/iUMMJXqbDLx
         jyX5DyxuN70peP4RrcxwMDQXiCom/+h7+Vx93u6VHSI8gBlGQBD67g//j8vUiaRsZLx9
         RGzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=2+ixT0xQP+mP0HStWNqLdMTqR4OnTrGkx2KULhxhIHc=;
        fh=ecXz5+IsThWE6dkme7ssyphrG7iw98FSg6CfeHJWVBk=;
        b=HkQ+Vu+AuKqmaRQcjMD622JqtQfbhlyyJr/zo1ZCe9nzW69UjVN7v8Sy1Mbu/Nsjmc
         m8DWUNPFa4vKHn/dK5K1oZL3MsCxlqK6DaJf7ke9f4l3TJtxO5TDbQzXO6AvBOXmKpOM
         L9gyE7ALUPyq6e4U5ubVsgYx5RP0x6WdCfaFOsyCJogQws06lhucUhNdDjhFmUerjydC
         1IfsZBtBqA8PYi/VVMbd7Qp/LgURzGncNgdSu1/ekcnKg7w0DLd/KJQQm19gODPiIsgY
         KlvBkiLeC7LZkzRiAPDH1PG7fA9kCcptelpIE4kXLVKYGRddT8mvMYPFQq6ZyeMRp0f8
         eehg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=sfbFSDOo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x14-20020ae9e90e000000b0077f319cff23si1473357qkf.21.2024.01.11.11.25.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jan 2024 11:25:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=sfbFSDOo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rO0gM-0005vE-VV; Thu, 11 Jan 2024 14:25:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3pUCgZQQKCNoBHSQCKKCHA.8KIMAIQ-6NIJKJCJQ.KNC@flex--flwu.bounces.google.com>)
 id 1rO0gJ-0005u2-6y
 for qemu-arm@nongnu.org; Thu, 11 Jan 2024 14:25:36 -0500
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3pUCgZQQKCNoBHSQCKKCHA.8KIMAIQ-6NIJKJCJQ.KNC@flex--flwu.bounces.google.com>)
 id 1rO0gE-0004CR-KK
 for qemu-arm@nongnu.org; Thu, 11 Jan 2024 14:25:32 -0500
Received: by mail-pj1-x104a.google.com with SMTP id
 98e67ed59e1d1-28be2bd2ba4so3568604a91.1
 for <qemu-arm@nongnu.org>; Thu, 11 Jan 2024 11:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1705001125; x=1705605925; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=2+ixT0xQP+mP0HStWNqLdMTqR4OnTrGkx2KULhxhIHc=;
 b=sfbFSDOotWa4K1IF1whLoJ/MnX8qd9OqcUsFJr9HNCf6XtkiT15EGRmolqIB/SDY+2
 h2Loq12OonxxhQ2MXHtAPn1Qslfp380gGKUh5Da+7m2/501JE1ZzBWr3jqyI+b7A+5EG
 b++1UNDi/2BtH+UHiBBv+UaJ4f9qXVHtndCPSIfsVB5RUKjvPyiosE+b9UE2AMgMu+m8
 mlfYzSnvv3z0ytinMKGiUj9C11lEh3YI8J7eyS0QzoDwUkCk95Ttlpf7kGLLravAg1DX
 S3+VLliqvmnY3BTtOsaJXZiTzy0zukjpjsshS1cmkUPcvCP44mdk+r3u3gdXCv9DGuQD
 Go0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705001125; x=1705605925;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2+ixT0xQP+mP0HStWNqLdMTqR4OnTrGkx2KULhxhIHc=;
 b=sxjiGYmb5AlxCv11I/LjIQV/DZm/HUMqPZS8qqBd3Yp2ppHeQ94T0OghnHhoWUcO02
 gId0+mh/Ldpo17//wys/lwZz9IiBiw4/iZCdoKI1k+CKBdnWbE76Hu9IHKv/xQCbO/Gc
 fLUCUv22H5hJCQu3x289KHPvCe9YGvC82CVmTCnA+A8YCwrgPV1JY1DGNg5NItLd2ewG
 ZAjJdL/I+WwxOrv7ADxi0ACnyuIa73KMGjElvezC5FzABW2RyRGkaOlmPHSWk7iGvsSs
 LdSBR6EOrmNPjHaSN5xNlA6nsj7LnhjugfbZbhRSYtG/gHkUi1cIKkIR+WwnX3pTrdLf
 zelw==
X-Gm-Message-State: AOJu0Yw1a45fFX5WvRin9mfLymScXJFN0lHcdhfngW/G44vNAutirfrk
 +exfQFEAAJr54Pw5l+VZmeoUbZK3TB1VO80=
X-Received: from flwu-kvm.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5ceb])
 (user=flwu job=sendgmr) by 2002:a17:90b:538e:b0:28c:c1ab:89a2 with SMTP id
 sv14-20020a17090b538e00b0028cc1ab89a2mr1290pjb.7.1705001125304; Thu, 11 Jan
 2024 11:25:25 -0800 (PST)
Date: Thu, 11 Jan 2024 19:25:21 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.275.g3460e3d667-goog
Message-ID: <20240111192522.2795498-1-flwu@google.com>
Subject: [PATCH 0/1] smbios_build_type_8_table should use T8_BASE.
From: Felix Wu <flwu@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Felix Wu <flwu@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::104a;
 envelope-from=3pUCgZQQKCNoBHSQCKKCHA.8KIMAIQ-6NIJKJCJQ.KNC@flex--flwu.bounces.google.com;
 helo=mail-pj1-x104a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: aG6iaza+A8PT

It should use T8_BASE instead of T0_BASE.

Felix Wu (1):
  SMBIOS type 8 should use T8_BASE.

 hw/smbios/smbios.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.43.0.275.g3460e3d667-goog


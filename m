Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp361804ejc;
        Fri, 13 Jan 2023 04:49:47 -0800 (PST)
X-Google-Smtp-Source: AMrXdXta7Umge0xy5M4SCRsV8Epzle/5kiRl2fEbjU0613rrrmrvfQ2ZjQZAKj+UwTf2yVg8s8zG
X-Received: by 2002:ac8:7513:0:b0:3a9:8b17:d090 with SMTP id u19-20020ac87513000000b003a98b17d090mr114019445qtq.36.1673614187634;
        Fri, 13 Jan 2023 04:49:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673614187; cv=none;
        d=google.com; s=arc-20160816;
        b=x7plvyPyYoi60ghPBdNe8g9eWpBjwVi7wn7uG0hhbAuAA21h3Q28aoe98qh5ifbcln
         TSGyNCsUscBZK2NJYAAy6IZN9WLpUAOOyhfGfPGZreO5O4TW3VlDUNYk0NVDjGjjmzTS
         OVVBcBMOXcplgBfFPUVB5STHH7bGcLju7T0zrqKwuxQJbOcG8+/9MS9Elj3xj5YCDUb+
         E5Kir4Stu580XPW843vPJERu+1ggtPwSXFaYPtTb1TF4S88WzcA3vMpxdztfuIIhFBAY
         h6s2GNnZPUrEJOjqoftAYwZvmgC18VIVI+oGzEw+6EDGUv64G/Y9xzZFn2tCm7kL8Ygq
         wOAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=jgKk+Bp4VDQHumrIw+UiMcSHawBjFRqDdJL19jey4fI=;
        b=HT+2dIvZRj5hR5bM3OC2teyOzzdLG+3Bd7dqT7GNS15STyWX7Ut9qfeGqvyF22+h0h
         QTbLA1q2vUVo42ul0xg9ELP37WAKfBoqDlFWTYFIpAdiccHkKDDbZOxB3qdYzWy1bByg
         0hsfmEpgahPo9tAjTWohkF07eHjMRP/Rmiu7FgwDhRItk7hqXsw7D4KJdvlc4Fejk94y
         DaSye/RqIhmYrsnOzZT0ntHjXV3Ytd8i8S0LxOiTOKBmx5rDfS1Jzs335MK2BDOC/PJJ
         UkPbQgcdCqMo/aVy5F7QzSyyUhAAXPIY12Ags4mxAmmReaXywxnphrDQxTs1JshlC/1k
         35qA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="g/k/rbus";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j13-20020a05620a410d00b006edee0f497bsi13383734qko.30.2023.01.13.04.49.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Jan 2023 04:49:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="g/k/rbus";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGJUq-0005a6-Pn; Fri, 13 Jan 2023 07:49:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGJUn-0005Zh-LQ
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 07:49:22 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGJUl-0000Ai-Pm
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 07:49:21 -0500
Received: by mail-pl1-x631.google.com with SMTP id c6so23350706pls.4
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 04:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jgKk+Bp4VDQHumrIw+UiMcSHawBjFRqDdJL19jey4fI=;
 b=g/k/rbusRE4JXpvlBKu5tDms/YupK1oQWRCwyXtaxs+sf3SCWAI7z9ZZz6Cg7MwDEr
 cNjk33OtKUn1DcrzM50+Xb+31DnZ8QwflmXhfgCTteNBbLwUtAYwesJefqEG/9fdBkCU
 Mc8T2kivzqIBN52KfW+7fowmi3phJ77NtF5nsVK2sbQUX93qCxkZleURoFMz0enIKMzZ
 cyVgLjASdAjrhgdG03OOvJv1i7VmU5n6CIidDnHDw7K9YGJcwnyqeDHOl5rfwpujBMJt
 PXdDDwuJu7CTw0mAW+y+amdeBeiVXIpufs9sP3OiVpneyFPKkm5IyM+KeSsDXjw1GGzc
 S/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jgKk+Bp4VDQHumrIw+UiMcSHawBjFRqDdJL19jey4fI=;
 b=1GieGjU2iyhlM7otQtQtIF4502k3wjDx9RCKkdmqhiXeZ/gEjcFvdWIm5Lmyp7/ypZ
 FTxXGHCMaqAAbr7UGeLgyemgqDz4notrITMBombwMOVXVUCpwczoQk5eIjaoMhyO0GcV
 L0rPDOVzfKCXXmabMHaC+5wpUYdN0qIuE2NBz9g4hzTEM7wDAUK8S/FLudALG4oYbthS
 vwWjuEkhNQsPGAM6SDxzXwI/8FTm5xvqLen3n2QLWrWvuHPhV6j6DD2BBTGdWK7dfM7x
 ZoVwdVrlvuZJH8mwRFoV7SsXJyczHJTPhOCtaKUhGrDCH9wpVorb//hb7uF8k3qnWSL0
 C/4w==
X-Gm-Message-State: AFqh2kqjVxdaT5DLUsvau7pIRz6vkPU7JfSDdhsRvISLV0LxZv9pO6cp
 MHEd67j3TPRGYoL8Wn8qwWy8oo2U6l7oSgHWWRngzg==
X-Received: by 2002:a17:902:e0c4:b0:194:45d0:3b2c with SMTP id
 e4-20020a170902e0c400b0019445d03b2cmr965480pla.52.1673614158055; Fri, 13 Jan
 2023 04:49:18 -0800 (PST)
MIME-Version: 1.0
References: <166990501232.22022.16582561244534011083-0@git.sr.ht>
 <166990501232.22022.16582561244534011083-1@git.sr.ht>
In-Reply-To: <166990501232.22022.16582561244534011083-1@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Jan 2023 12:49:07 +0000
Message-ID: <CAFEAcA83MFr0qq5o_CzHhvPzu75ayDcRSxDi2BAVzzt-gZFhbQ@mail.gmail.com>
Subject: Re: [PATCH qemu.git v2 1/1] hw/arm/virt: make second UART available
To: "~axelheider" <axelheider@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: j18YiGJOJWHV

On Thu, 1 Dec 2022 at 14:30, ~axelheider <axelheider@git.sr.ht> wrote:
>
> From: Axel Heider <axel.heider@hensoldt.net>
>
> The first UART always always exists. If the security extensions are
> enabled, the second UART also always exists. Otherwise, it only exists
> if a backend is configured explicitly via '-serial <backend>', where
> 'null' creates a dummy backend. This allows enabling the second UART
> explicitly on demand and does not interfere with any existing setup
> that just expect one (or two if security extensions are enabled)
> UARTs.
>
> Signed-off-by: Axel Heider <axel.heider@hensoldt.net>

Hi; just wanted to say that this is still on my to-review list.
As a preliminary note:

> @@ -2222,11 +2250,12 @@ static void machvirt_init(MachineState *machine)
>
>      fdt_add_pmu_nodes(vms);
>
> -    create_uart(vms, VIRT_UART, sysmem, serial_hd(0));
> +    create_uart(vms, VIRT_UART0, sysmem, serial_hd(0));
> +    create_uart(vms, VIRT_UART1, vms->secure ? secure_sysmem : sysmem,
> +                serial_hd(1));

Creating the UARTs in this order in the code results in
them appearing in the DTB in reverse order. (I forget why;
I think dtb nodes put on a list in one order and then
put into the dtb proper in the other, or something.)
The result is that if you add an extra '-serial foo'
argument then Linux decides that UART0 is ttyAMA1 and
UART1 is ttyAMA0, which is a bit counter-intuitive.

This can be avoided by something like:

@@ -2289,9 +2289,20 @@ static void machvirt_init(MachineState *machine)

     fdt_add_pmu_nodes(vms);

+    /*
+     * These end up in the DTB in reverse order of creation, so
+     * we must create UART0 last to ensure it appears as the
+     * first UART, ttyAMA0, for Linux.
+     * For back-compatibility with older QEMU versions, if UART1 is
+     * the secure UART and thus always created, we create it second.
+     */
+    if (!vms->secure) {
+        create_uart(vms, VIRT_UART1, sysmem, serial_hd(1));
+    }
     create_uart(vms, VIRT_UART0, sysmem, serial_hd(0));
-    create_uart(vms, VIRT_UART1, vms->secure ? secure_sysmem : sysmem,
-                serial_hd(1));
+    if (vms->secure) {
+        create_uart(vms, VIRT_UART1, secure_sysmem, serial_hd(1));
+    }

     if (vms->secure) {
         create_secure_ram(vms, secure_sysmem, secure_tag_sysmem);

I still need to:
 * look at what UEFI does if presented with this DTB
   (may involve filing a bug report to see if they will
   change the enumeration order if it's still silly)
 * check what happens when we boot Linux passing it the
   h/w info via ACPI

thanks
-- PMM

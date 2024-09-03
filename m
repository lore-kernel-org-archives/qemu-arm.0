Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1504183njf;
        Tue, 3 Sep 2024 09:18:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX+xC0bOuLWiHOICH/AXfKb9G3KMaWoVkD9gsWkMKkCAK3YHHgn2PffWUXl4HgzaiDdzQcL4ZTzkIKb4A==@linaro.org
X-Google-Smtp-Source: AGHT+IHzxja5pfgSK6UakRCB2g2zaP7n2wXppvuYhPExrAINcA5/tzAz9d5a9IAmIIAhUv+6xc6Z
X-Received: by 2002:a05:620a:4006:b0:79f:aa9:b3a0 with SMTP id af79cd13be357-7a804bbed56mr3536841785a.13.1725380324497;
        Tue, 03 Sep 2024 09:18:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725380324; cv=none;
        d=google.com; s=arc-20160816;
        b=DXUPzKhCNUZmr3/vco6QgY7hFAAnVIMcxrRNx61ghH8I4DLTVfj2jwZN5kBuidrCpa
         IcTNTQRWAt7EpZ7oatSZHk6uFOeLBeR9XUSaW+ScPdZLljBp0NOPpW8FIWykBCQHgwzf
         Zzs1NSpng4vLc4ma9PXTU8YqgvvAbX33NUbDRymnRnOObdCq8b2WGBxQv37V+w4TCXUE
         8Xs/bOji/KvVIZtvo+pO+b4GPHcp8IQKnbLbFTp5aIWN1SIG4dqhcKEgXPo8YSYkdL1G
         Ghy7zYLXFo2vIcYtB3TXgJIUN4FxC9Sif3dINn4hXpgma9u4jwmQgruQ0gaOVJeyea5h
         MLvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=dZETiYGcWh6PLfnPhF+BBHsRqTE81ai2WgRVYRqFS8U=;
        fh=e/zMl7veFQ4JL6q3TZSBJTf3AMq/hM3Z9nHdMogST1E=;
        b=yWyaWoN1p8Qz/n1GVOPCj05r56ZlNjOU6WAUNwE7GV+QTZpxyWGSL0G6w28NSJxMGe
         8AXajUHmngngCmrAHKZtSHZxvNO8y456+PFb6J8D/lgqIa8Csd09eBiRCIlS39RYhyZI
         7q1jVcxCupB8LkkMD3ZnX5C1bwtRyskyLDVlWZCkjXJ7g/w4eSs+jGiarJh6gbqGX4iM
         2Q4GRoHZrM7qZOtKASSm/Pgnbj5kWfh5TcGekn39FonEYWdtVe+6R3NoRmfqe8EjcOB9
         Y5IkbS6BXz/PrHm1O91KKlyqPoXISqYIST0OuPgmIKd+oSchqaAV129iCDC+nm/une9T
         eCjw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PfVfZRGG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-846c942d9adsi1265546241.35.2024.09.03.09.18.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2024 09:18:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PfVfZRGG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slWEo-0001F9-AG; Tue, 03 Sep 2024 12:18:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1slWEk-0000xb-AH
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 12:18:35 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1slWEi-0004LV-Ip
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 12:18:33 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-428e1915e18so46351415e9.1
 for <qemu-arm@nongnu.org>; Tue, 03 Sep 2024 09:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725380309; x=1725985109; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dZETiYGcWh6PLfnPhF+BBHsRqTE81ai2WgRVYRqFS8U=;
 b=PfVfZRGG19PlIQ8f+6MN0bCyuE0339jEjWZI3ZIWuTkFK3c9r+CUmI1Fl8IElQAX5e
 PbpgYdNB52fVmrZTkRpDaA1XqQFw9aTMzXQRyTVIaB2yHnzWpFSd/qfeT38VqCF0TxG0
 SN8mvBRK708RaZzpMy0CSmy3fvtbMem16h5IsrFF3XUtRcW92/bRr6uAVCxaNo3Ex1HV
 j0qRnb3R5xJ5lxJbZbMNyGvPckbrKpE7ehYV8aBdW+sFjMxzvBMsD5iUGSNVZ9U6E2Zg
 1qqaP0GkloqbPUKzpCKBp27uAzrO5InFfanop3TtCaToV8zT04CitnOqGSrI4ROxTyzK
 9V0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725380309; x=1725985109;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dZETiYGcWh6PLfnPhF+BBHsRqTE81ai2WgRVYRqFS8U=;
 b=UtWGat5ynviEkOw2xoXzWSBKA5usQ063LsIA8xgyTYC04WieY9s0Feq3yMQwLvGsYl
 r0XioBODe/unEyTJaGWDI7VP2XYXHHSyY0vRyUj9OJhJvF8tyDKp4knHC1dMbGVHT/UB
 4JPuHs9ixs42uzhxuMy4eahlnqy/55jDKr32RDqUeIAV4Z4iVTlBmOe9BZDlvSbxJ2YJ
 MjR2725VzxbrDEKHhNo+lPVI/+y7HcO9Q2Rnq2PSwUDhq4uFEbbGGsbVkqEYW5I7G6VF
 AGRK2dN1EA7QZxChJFd9VgVB0O/cOfSFGogEcsI60+9BCHZjp7v5eHio09wLE5ML8vXY
 BgLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvAIpWXcM3kY7jp9iSOqgytFtQ40Wz2RWi9s/cvl1F6NafTAjbzvPmYuNfrrvCzOr7fAAL49mwow==@nongnu.org
X-Gm-Message-State: AOJu0YwxXYxi0VJ1lNc9CBeXKAOmeB0WWWm+kLGxeucu45h8GNTmK5sX
 4ybm391tC+BQ3XWIa7xJfdIN1N6qeA3HgWCiMN91NymoAFGWb7t4R4hxuRSPXimwnDbZirY1NQ4
 CNkM9juh3r+GbD7a/1eM/5aY+psEW70Dw1qpKbg==
X-Received: by 2002:a5d:50ce:0:b0:374:bde6:bff5 with SMTP id
 ffacd0b85a97d-374bf1c94aemr6278935f8f.46.1725380309360; Tue, 03 Sep 2024
 09:18:29 -0700 (PDT)
MIME-Version: 1.0
References: <CA+1FSiirzpq4wjcKTLSexiOWtv26sgD37h=wA2qxv8Qh5MW_-w@mail.gmail.com>
 <23d60255-614a-4a06-b449-644f215555d0@linaro.org>
 <CA+1FSiitcSBa3JZaAZMGkdB356d2M0rPqscwFnNXGML5HghVCQ@mail.gmail.com>
 <c80e855a-ac1c-40b6-8a76-966e53c0b7d7@linaro.org>
 <4cbc21b0-0634-445d-8a67-7705a4e186d8@linaro.org>
 <CA+1FSigiu8xXF1OPs1oSPS7LiGe23gsN73RwPpJUYH=X5EkTRQ@mail.gmail.com>
 <CA+1FSiiH9LP-7UupNLjDyZJGqJAHAjN2nSLFm9fCx=ZNphxGoQ@mail.gmail.com>
 <CA+1FSih6t-Ccnxh1GvOFMf9pMjcfV1V+yyJHV=ZH0c2RY0Kjng@mail.gmail.com>
 <268989a3-cd5c-41fc-ba0d-5eb71bc6e9dc@linaro.org>
 <CA+1FSijygoVZmTkYR8Xoob4yQQdf9o3CZ2-LmzDrBh2e0VaerQ@mail.gmail.com>
 <CA+1FSigOmKen0QPKSEQqt15Zzrx4UFSCpj+5DJMCJtGnFcE+Hw@mail.gmail.com>
 <CA+1FSijfe+5V4RHs-1ow2JwAeiKcmW31V2Ddx9a9zxb_kybDFg@mail.gmail.com>
 <CAFEAcA-U5DpXysVoVQLAJzEKQ17TL82UiRXHH=q+chxwcubOJA@mail.gmail.com>
 <CA+1FSij0=6Zn_3HHq1njZgwjYDbopGe5ReUvjXkfHaD2_dCYzA@mail.gmail.com>
 <CAFEAcA_dprs9NhEZBd=BhMYwm4Aah7kRA_hhrbbh7Num4dH94A@mail.gmail.com>
 <CA+1FSihVmn9PAQ=18-RfhJ5Gz3hMeVTLh4qqamf_FG94gCoFDg@mail.gmail.com>
In-Reply-To: <CA+1FSihVmn9PAQ=18-RfhJ5Gz3hMeVTLh4qqamf_FG94gCoFDg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Sep 2024 17:18:17 +0100
Message-ID: <CAFEAcA9uffuCA_uQ3cZnPsTWXppNXdi-MqaGFZUeZrDKCbX0ug@mail.gmail.com>
Subject: Re: Error : init: partition(s) not found in /sys, waiting for their
 uevent(s): mmcblk0p2, mmcblk0p3 while trying to emulate Android 14 on Ubuntu
 24.04 X64 bit using qemu-system-aarch64.
To: Mario Marietto <marietto2008@gmail.com>
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-discuss@nongnu.org, 
 qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: KA1Z7dktoHiM

On Tue, 3 Sept 2024 at 17:13, Mario Marietto <marietto2008@gmail.com> wrote:
>
> It was only an hypothesis :
>
> https://pastebin.ubuntu.com/p/zjjgXf8xXM/

That log shows that QEMU starts (if the virtio-blk-pci
wasn't built in it would give you an error message instead)
and that the guest has managed to access vda/vdb/vdc
at least to the point of running e2fsck on them. So the
QEMU side of the virtio-blk-pci stuff is working fine.

thanks
-- PMM

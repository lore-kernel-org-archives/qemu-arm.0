Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2165993njc;
        Mon, 22 Jul 2024 15:12:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXPZUlOJQ2N3p7lDrjBH3art+Kf75q0GP3M55NDziTxfJ5oHQeCAYhpXDPr3vkrLmxznkS+WZn9XJrTgM6UGGVDTcm2ZwMi
X-Google-Smtp-Source: AGHT+IFDCjzmjElqriiVeVZ1UtOYmgHCjrjMriLXy9ZMJJWZ1Am8PXtUaLgueiPTPbLBob6ft2yP
X-Received: by 2002:a05:6214:224b:b0:6b5:eba0:d0ab with SMTP id 6a1803df08f44-6b95a5de433mr104399686d6.15.1721686331512;
        Mon, 22 Jul 2024 15:12:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721686331; cv=none;
        d=google.com; s=arc-20160816;
        b=q7zXdbjZlvWO+k7OkhCi8uPYL6z5Fm2/I1Y9XQVlj82Vj3IXDcFYQ/NoH1QeGOpaew
         h8EImVHxeym+QqU7hZwI8ibESx6PyMS+D+w4OWhWbTocD1DrZqI5OG7plSWiSEDkM2Bm
         j4U0/uoi3GwgEbJFj3q4sx9Twn9AJg6ux8vhJuJCJkj70oZ1D4HNazhQh2d0kPOR+fqw
         0s1EKpOQrbQqVOHf8LJOvADNNCsgmv5hBtIV0u4FoSNS0vUEP+Nw/9G1qvpi4oVPwvt9
         78ss1sL+37Dd0VN15JsPP5fsmEkQ8j375El+k+Y8cS6Xint8QTHtKOUDSLNHFtGH5hnD
         uQKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=AIVvv1BDlHnF4wBQD2bsGJRw13ULa3cNiyXd0dz5GxE=;
        fh=1/2IfcGbsViuct48FvwQzNKhQ8zi5rFDHgqDffGyAEM=;
        b=DL8/l14P6EtZXJp62BU028/ACKeAu/dS8XS5g6r3kI0Yi7fkKO1o/hNIgVHq+VFKW7
         Hlr3rvNlepbj49B7MWEkcLHZnzNM+2lLYqBvckbspu/20AUd/VcWs30Ui+kGEYBGDmVP
         beguYYPotl48Qi0ezqIR8W5kJ8n4nIlyF6XoGEdeG1NnQ9NoR/1d5utghB4guU0CBoxQ
         eEHqO17Suw8AKGvMAZI0Fm1w9xqJMUALfzhdZzrBJfNDP3GiPSdQJGFXbiAQpe6xrTKJ
         b4Yfc6Sclxz1yTP7iCNjn1xQY+aBl1H4O7FhXLqqqw7DxmKFjRx8HERr/WLJGuBVe1Ys
         tA2Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cxYCKsPl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b7ac79e9e8si83079556d6.70.2024.07.22.15.12.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2024 15:12:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cxYCKsPl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sW1G1-00062t-OS; Mon, 22 Jul 2024 18:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sW1G0-00061p-MR
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 18:11:48 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sW1Fy-00016X-1L
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 18:11:48 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-36887ca3da2so2063689f8f.2
 for <qemu-arm@nongnu.org>; Mon, 22 Jul 2024 15:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721686302; x=1722291102; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AIVvv1BDlHnF4wBQD2bsGJRw13ULa3cNiyXd0dz5GxE=;
 b=cxYCKsPlaW0eu9q/MqwivEwLNjTQQelK2KTEMj0vOasxncgxZiLZBTt+1LqJFfmVQQ
 GyEiOVRsyfnXv3hw51vrDRlh9bXYV+i+faMwgVWCw0nBCuAnwdq6rksfUwUpRKGwdy5K
 WmM8LVhOPRIwB40McxqapGvJMwbYp6twWy0HleNrwJRLlh8f4RpueZjPUy+H5KC9RDq7
 Cb+UbNX6ayw2+SgxQiTeht2kUVELi646oMIA7RSBHAxYUOMWJ3p0F9uVjeWORndu/8nn
 PpFfJ2EQebbzOUpp1UFzbeCZPRtf9sQk6Z+9K3Qgp4nUjxoZCJUg0w7Cz5TwwEKBphKb
 bw8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721686302; x=1722291102;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AIVvv1BDlHnF4wBQD2bsGJRw13ULa3cNiyXd0dz5GxE=;
 b=m4jafThF44cnn0vcuz2u53w8CtJWfLu67k7zwfTJvsVh9llCjPF9nanhKEgNK4pvgL
 TABgVpilsUgjFZ7Ku2KsFmOeHZtWFUNnIxrrTZA/rAYCs5jkpwB53hgHki3ovZtgJb8+
 RuJaVUaD+0x7KDWFownoZiC7issJjh1Bwq8gLo/qjyMZeiKBTcxpwyidY/r0HNL6Dj+F
 rsJc4wqfP61ooqB4COF9ofb/VnTZANaS2JgH48NrGsneYo85cvKOnbCZ/psSms2wEPNG
 JKMihfnRy6AlRCgBUqAgIWaKKQCkbtEIXZqPUYBhos0Ekpe5AEcOCr7kQxBgM5htUHhC
 C17Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPXKu1ZBTj/1NpCzs3kWnOAOn8k4t0njiOhDFbiAKESG/W2RhOzvDxjV9C7dzZ+9cez7Q/8LMS9/P28UlJ9hKcgDVr
X-Gm-Message-State: AOJu0Yw/hWuwkOzFhEiXJP09grUz0Bt6TE8n2wyFrmuauZWB/0S5Whqe
 Za2eQy5MMdWaGH6acDIHlkKRSupXvzBLARnRHkIrUi7agMN+mLxK4M1qzaE6SLo=
X-Received: by 2002:a5d:6201:0:b0:368:4226:4084 with SMTP id
 ffacd0b85a97d-369dec0488dmr729611f8f.6.1721686301911; 
 Mon, 22 Jul 2024 15:11:41 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.208.14])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d6937fc7sm144956295e9.46.2024.07.22.15.11.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 15:11:41 -0700 (PDT)
Message-ID: <f2f6c27e-7625-471f-b888-0f3a870bb0c4@linaro.org>
Date: Tue, 23 Jul 2024 00:11:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/14] bsd-user: Add aarch64 build to tree
To: Warner Losh <imp@bsdimp.com>
Cc: qemu-devel@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
References: <20240722214313.89503-1-imp@bsdimp.com>
 <20240722214313.89503-15-imp@bsdimp.com>
 <f3c9d0c0-1cfd-46c8-8524-cffbe5180d3f@linaro.org>
 <CANCZdfpPrjt8G5WWRPdMNWyb=hskk7ZCVS3HEAcway=XO=K3ng@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CANCZdfpPrjt8G5WWRPdMNWyb=hskk7ZCVS3HEAcway=XO=K3ng@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: QjWFlBFcaX2T

On 23/7/24 00:06, Warner Losh wrote:
> 
> 
> On Mon, Jul 22, 2024 at 3:54 PM Philippe Mathieu-Daudé 
> <philmd@linaro.org <mailto:philmd@linaro.org>> wrote:
> 
>     Hi Warner,
> 
>     On 22/7/24 23:43, Warner Losh wrote:
>      > Add the aarch64 bsd-user fragments needed to build the new
>     aarch64 code.
>      >
>      > Signed-off-by: Warner Losh <imp@bsdimp.com <mailto:imp@bsdimp.com>>
>      > ---
>      >   configs/targets/aarch64-bsd-user.mak | 3 +++
>      >   1 file changed, 3 insertions(+)
>      >   create mode 100644 configs/targets/aarch64-bsd-user.mak
> 
>     Can we build aarch64 on Cirrus-CI? (not clear on
>     https://cirrus-ci.org/guide/FreeBSD/
>     <https://cirrus-ci.org/guide/FreeBSD/>). If so, could you add
>     a follow-up patch to build that on our CI, patching
>     .gitlab-ci.d/cirrus.yml?
> 
> 
> We can build aarch64 host for bsd-user for sure. I'll see if we can do 
> it in cirrus CI.
> If so, I'll try to add it to cirrus.yml.
> 
> This patch series adds aarch64 guest...

Yes, we want to use a aarch64 FreeBSD host to build your FreeBSD
aarch64 bsd-user guest and test it. Am I wrong?

Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp275734lfb;
        Thu, 21 Jan 2021 14:02:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxyePIWsL2kveUWJHX0OVYCELSGtEc1RAqQEt0wJwsF7lSpb7vd24xOI+JV+i43ExU1AJtY
X-Received: by 2002:ab0:6ecf:: with SMTP id c15mr1538392uav.52.1611266575515;
        Thu, 21 Jan 2021 14:02:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611266575; cv=none;
        d=google.com; s=arc-20160816;
        b=gFbXlftfxvea4tjs6MvcnEhMYefB+mieJkfdBf3DRAuaFVyZBmL9xHM9FdDGXdxqKj
         3W+IARbvV8Hs+LfDATXfK+mQDzYxIK4rtgVaMid17WcRxL4xBCW7AqTpGbU3steck+2m
         +3FKby3//gTuwZiBsN23ixLfNDBXRmUd2wqZKFO5Jm36WkcrRtp6NqTlC9aWcfdWFtpn
         J0xJzonl8yBXDTf1i/PhGadCcldi1lKiYmBWc4J6FvwC+01pmJGJKnQUNtjGFwfX8qIA
         67KzsisIJOFHnsig1cQQ2GmC3pNjNMBwQwBdLjL4JbR32ieW818W3EzqvW88ub35KfG4
         pYSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=7BNAA+ek3eTcbX6hXprn5aoGyy2tbEWSaSQ6aO3exXY=;
        b=EsFRvwVuTiuy7SkjVjcTQduzX77Ss8a+TkkjSzJTWMJRvOXy/MTfsOp9LC6y+THpbC
         rIEsUPf/Q7R28myi6Oa/+pjIwiqqEtRRRp1d1JrZgyJ5fk0zuMDH/ylP63l/pImxP1J/
         3I0pmotLqatZupszRI1hjkNAv+wqpnXbXxjZ1NI5Ohtc3SvRMv1YmS6Of4z6zhutS0vK
         St4OfEKh9lWd1oWMN9z22lDMSbeBX4yss/S2p0j4YrYs3c4/8yaQ9PzcWRyV8ixpDIDm
         uT2DkNW0aW3cFHGkFxVyG6UJV6EhvSYBB5NfR7ZntwQr+hj4NK7+X5DZPTctUdPOCJKe
         cRdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CpcnuIh9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d1si1447402vso.54.2021.01.21.14.02.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Jan 2021 14:02:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CpcnuIh9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:37850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l2i2Y-0008Gd-Oc
	for alex.bennee@linaro.org; Thu, 21 Jan 2021 17:02:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2i1b-00085E-7g; Thu, 21 Jan 2021 17:01:55 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:36398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2i1Z-0006Ck-Q7; Thu, 21 Jan 2021 17:01:54 -0500
Received: by mail-ed1-x52b.google.com with SMTP id d2so744645edz.3;
 Thu, 21 Jan 2021 14:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7BNAA+ek3eTcbX6hXprn5aoGyy2tbEWSaSQ6aO3exXY=;
 b=CpcnuIh9Qxpgbqq9g4TfuKyTM7WPVCIHnq4CAGqhECVydwckZf1XDp65z+KysYZ4fK
 DK8Uxd23K2FZ9nBLDqRRXnu8OFhbgRA2cdBYxQnTl3WQEYsuiDF5oQcyN3SuC6j1PF6/
 mEbfFVpih9nWfBUTrzRwiphmymrORLIjfkAGztUTa+70xDSeFOP0jiX5cXOFyBfHqflA
 zz2ZnCOkSI3UPc7WEA2zezs36sT1V1reYBYDKvOidS7lFM0Nv93G/+LycGvnDIJqa04t
 wD8Y9TkOOAsX3/0EqjiM8frEQjtkHJCUkbuRo32APBd80Mcj9vy+rRtlRNweJUkzofjl
 Fs2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7BNAA+ek3eTcbX6hXprn5aoGyy2tbEWSaSQ6aO3exXY=;
 b=tdPVUJDPLUT/GpgHxiCOLcf4NPg2di8PlCvzSu4LzdLll1jxr+jAfl5hfsBugVBCNU
 QWrKMTCcox4aOfTYN73Q3srqM9MMnsaR1xQ19+o3nt9tD7RdbLA+9A9uiocZQeqF7ztR
 XJLtoXpRrKK/lrVepMVpqg5OL8W8g2+cSzO/NPAFa8RB0ri0rjys885ZOZ7D7tRvU7mJ
 S+S8HqIVhcP/Zj8DsWpmXcmAa6O61jubCC/xZWTjCQ65eTHVr0GtBHS8NNbU8laxd56k
 lTQlGmKU3E+rE0YqlWG8Zouu2NCPpWEaZRfcO8gXaE1KKQuJvs7GLc5FwMuuT5JcYvoC
 vTiw==
X-Gm-Message-State: AOAM531jtRRxkeTO4EnSuM8lBA13d5tVmcyQsbUSINGj4lyG7r12gSeD
 /SY67oOBllOMIHyNNy+rKjk=
X-Received: by 2002:a50:c3c5:: with SMTP id i5mr977174edf.166.1611266512157;
 Thu, 21 Jan 2021 14:01:52 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id w11sm3610421edj.8.2021.01.21.14.01.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 14:01:51 -0800 (PST)
Subject: Re: [PATCH 20/25] hw/watchdog/cmsdk-apb-watchdog: Convert to use
 Clock input
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-21-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4aa239a1-c958-498e-e2e8-1bb61876c9b4@amsat.org>
Date: Thu, 21 Jan 2021 23:01:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210121190622.22000-21-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c8UpxF/3eEZW

On 1/21/21 8:06 PM, Peter Maydell wrote:
> Switch the CMSDK APB watchdog device over to using its Clock input;
> the wdogclk_frq property is now ignored.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/watchdog/cmsdk-apb-watchdog.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

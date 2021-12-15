Received: by 2002:a19:8c50:0:0:0:0:0 with SMTP id i16csp201943lfj;
        Wed, 15 Dec 2021 13:38:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyo7yf9z3On1d5ZsjjH9AMlPBSQxmFGSl4GQnKnQF0dHA8hFBIgQ9bW2xdFktXEKUjlAFas
X-Received: by 2002:a25:b47:: with SMTP id 68mr6530949ybl.378.1639604302387;
        Wed, 15 Dec 2021 13:38:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639604302; cv=none;
        d=google.com; s=arc-20160816;
        b=LEfcEiZD88FAPHAwKNP3rZCoQZKCAmRnD+3JXRRkKF8qqCYXHQilCQsXbwUWB3Exw7
         qw/ClpBt71LOiTn0TpItSTRmROQ5BcsUP0V5/FJfiMwPFkrOxASiZ3xZndfahf3JCKTm
         gsPf/oA8u1xfWCrzYwDdTF12wwEMLJBc14PkpoxiGTOfnNC+p/+S2v6LySCt2V0ry5/s
         T2wktuRD4C7ShOS9+QvwqgkcWvuH7bHsamWMCijrvGgJEJ7IWYFk486AUEb72SNlf6zS
         Wwex1fhB9TWT6Ad8kPJUDogzB8edAWoJDCthdYszqMN44DLOdJMt+HfztDZry3AJHBla
         g6QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=r45rCJYdOR2FFbo429A5h6cLNkqAc7E8lZ9Dg3UlzpU=;
        b=nr48gJjz6YABs5LZYDTssNf+OlMkXVQ6YxhtsLI6SWVSfyneDUJiwto9HVxeurUOLo
         lIUbKz3E4CEoyrHqWE88Y9uPaVUYGWKv28zP094oEAqFELP9Cr1cSoT+Szg3pJU/bOgj
         EK52t87RzV4g7n7nWh6gvtRuaqR4VHRxoZ7aPdstMeAahWTljUgnvSuCg2JDXGeIRlNb
         sNiMruTXnQ++jybp47Qq1QED/VjW3sgLqfhEsMPzu+JvBKmtvOJvCav304GY78KN/4rT
         SukgsCnDJrh4sIg/PRN2l9LRmApDg3bHMOA4aR45EkXdDw/JNX+ef3xsDUFg5LUO0/zX
         og3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b="G/llAFNI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d12si4271006ybe.100.2021.12.15.13.38.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Dec 2021 13:38:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b="G/llAFNI";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mxbyf-0005ed-NO
	for alex.bennee@linaro.org; Wed, 15 Dec 2021 16:38:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxbyP-0005dZ-4V; Wed, 15 Dec 2021 16:38:05 -0500
Received: from [2a00:1450:4864:20::429] (port=41802
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxbyN-00074H-Hc; Wed, 15 Dec 2021 16:38:04 -0500
Received: by mail-wr1-x429.google.com with SMTP id a9so40504168wrr.8;
 Wed, 15 Dec 2021 13:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=r45rCJYdOR2FFbo429A5h6cLNkqAc7E8lZ9Dg3UlzpU=;
 b=G/llAFNIaU4e6L2sU9hUwT3hqijHVoyH0XVh8TjFKcFJiBaFxkfLdb7TX2p3+iqOGZ
 crpCWyevjQtK/hMe2+YPcS8/mtDteJ63ge42hD4DRUbGxMpy7uydLs4jgd8kd5676k3t
 02W/84iMEQuNSv494m3HmKAfvu9BDyDN4QTY4v1szEuamqnYO+/WyQ7Sinn9WZ5xTk20
 LYDCxfC/vcgzzmeBIyjS194NFaFkZgWzdnnAlPGJfHIXKRnI/LgCORDL/Up4T1l9BNBF
 sh5pUILdHAjC7YosnSAbBRC9mw77cmJOM0Zu2+mh2BBSIvx0QFd3ImBIyQmnIIsn0DcX
 6MDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=r45rCJYdOR2FFbo429A5h6cLNkqAc7E8lZ9Dg3UlzpU=;
 b=I1yfXBqV5EG9MTzq3SyJtlr1hedGkORolhxsqPygKMNfc4fLU6fUeRTLB3e5vq6QTr
 xCBQsN6zPWt2DVdC7boPFE4AgY5SKyV9NEYvnvbvu2OEQXKepn7wy0tpazqAnWtxy95C
 Wb+vgbpUk36MF30XVgbcH9rzD8mxyEnI7yz4cEgCie5ckQx8JiZWOHrZEGz1nOvjns2D
 qGjm83wl3m0jt+Jc7x2Dyfv2zA6e7ZAWNaRpacAwvQrZa03Cy/0zmVgllgm6WcB58Qbj
 TE4TYGi8XIhvJwKmmtMd8j88d67pgUkdPt+66upFtiZNOhxhHhav905vURkkxKpiPUP0
 8bAw==
X-Gm-Message-State: AOAM531AEoKmCek/VuL+TCqtbKZLUpmsR2oHivOcaf1QuGn0fz1xIq5l
 XkZE26Cxk+WxLSKHVsrRdIY=
X-Received: by 2002:adf:f9d2:: with SMTP id w18mr6021199wrr.501.1639604279908; 
 Wed, 15 Dec 2021 13:37:59 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id j14sm2506200wrn.88.2021.12.15.13.37.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 13:37:59 -0800 (PST)
Message-ID: <c239b30e-fb83-25d1-2649-a5285f97f9ad@amsat.org>
Date: Wed, 15 Dec 2021 22:37:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Ast2600 emulation
Content-Language: en-US
To: abhijeet inamdar <abhijeetinamdar3005@gmail.com>,
 qemu-discuss <qemu-discuss@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
References: <CAP4GjT1kgpr+EoecEVdXuX+sPL-27PKPm-9J-E3_DwaHwe12GA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <CAP4GjT1kgpr+EoecEVdXuX+sPL-27PKPm-9J-E3_DwaHwe12GA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.64,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EnRhSgimvauK

On 12/15/21 22:24, abhijeet inamdar wrote:
> Hi,
> 
> I was going through the aspeed ast2600(not evb) it has Dual-core Arm A7
> and embedded M3. How can extend it/implementation in the existing one.
> 1) Is it possible ?

Yes.

> 2) How can I do it?

Look at the Xilinx ZynqMP ZCU102 board (4xA53s and 2xR5Fs):
hw/arm/xlnx-zcu102.c

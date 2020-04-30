Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2221197lfm;
        Thu, 30 Apr 2020 11:37:25 -0700 (PDT)
X-Google-Smtp-Source: APiQypKwyfozTkjxmgnu6GKfl78hg4C/IMgGnUEFLJ2uvR/QalF7ePvC25YqU3K6AaAvUULXjwUR
X-Received: by 2002:a37:a806:: with SMTP id r6mr4957906qke.171.1588271845570;
        Thu, 30 Apr 2020 11:37:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588271845; cv=none;
        d=google.com; s=arc-20160816;
        b=zzad+cbSwqRg1FjxLwdVWFKQMM5ErqAJLUNBzerqrWKiTxo57+7RZd/ezszA0LJhZv
         adw+IUE21Fa9NoAP0sBghr4FCnKL4C1e+trCkidHOdaBihwdzRt6QXgajKLlQIQK7fMK
         yr3BgUw47lkghxXd8TN7LGL8AgRusVC70dUxip04ggkqrGmWozRLzTFx9CW8BiKcT5t9
         nva0+LssqTOmh2Zc4a5xxp4+LUCjbNM++wcojCVuONTlJF8QoLLX4l+DeYTP0EYQ2Yg2
         Vq/5OAOpH1gdl2BJG2Pp0Xs9esYZMLbn0QmLCAhIC3hV9w6zovjig+66mqZdy18OKXMF
         mcww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=F6g6mEtmbQ9LmExkmTM1p9gOg2bAjlBZQ54zFDHidOA=;
        b=WeYpg5G1kIZ4whe22zk0B8dq18eLPPenx156PcwDNIqIuhPqzrSBvV4VFoW76BBQAH
         y1kF0aDgpk68xeyWhL2eQYKhhBzlg0REPu5M0ikMttFjuGrDek9Lebr4W36cW0/hkZy1
         lO2dEee4+Vx6O9JmC4WBOq7a7KX/wYs+5WQxlaLtA5WDCwDX/wjvGmFn67CgGHJn+w3V
         yK++4oSrjpSOOLI5WxRJoInLVO/0CP6nz/ILg1H6bdfFPfR/Lpe/i3BSbTBjicn8sGB5
         W2L/VWRSY4qDwzS3JGBEO3Xv+XEJLVt3TijqraEXQJftKG4CJJAm025mpF+Yc8YyaENy
         gceA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hjl+krql;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id q12si200151qki.268.2020.04.30.11.37.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 11:37:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hjl+krql;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUE3o-0002mV-VG
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 14:37:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37562)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUDmr-00075c-Uo
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:19:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUDmj-0001PC-Jb
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:19:53 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:41263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jUDmj-0001Is-4w
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:19:45 -0400
Received: by mail-pl1-x644.google.com with SMTP id d24so2553855pll.8
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2020 11:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=F6g6mEtmbQ9LmExkmTM1p9gOg2bAjlBZQ54zFDHidOA=;
 b=Hjl+krqllC5v3LPYj5sCC4Ub+vGteAp049Xlj3CEJG8NDIlrvu1PSEM7R1cKeF75gP
 dQywNoOvdch8YlgmQQThPdL0PBZdLsTJKwh1w7+g4nlCxQKyrB354gBGTuqh37I/yQml
 yMYL1OMAuiah5F7S6aj2V8B4cPaXq1zvRNHgYE6PPMX/JaTGjUrbl92oB3+AFyS+j7/o
 FZ40dF5nVBccyTaWV5bM1urUoWxi1P/ZvUjxuHtfLQf4SGkmCxbbrG8FpV8aS2ZXHS+N
 +sSVgZxeyvfuLF28cdpfI4CxDdczGEdRfKLeGFo4+gpxbHo8yVGrIpBEfHYMtwizJH5I
 2cDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=F6g6mEtmbQ9LmExkmTM1p9gOg2bAjlBZQ54zFDHidOA=;
 b=s1DS7oCVxm7o+lBxwaUrMywI/92UhMqeWfVWY+z2GU79XnYgO/B/CSgUEvs5gPSbOF
 Q9Q1ZGtMltYrt9r0jRYtxNMk+C8lRKyHaiop/FR3Eo+Bc770sISmbUlcufuGaFmxaL/A
 Vl1MhVR4Lrn/W5sG5e4uJ40DqEQKylSjuFkV1V2dIr45dA3Uz0snNqQfhIl6MOso9g5l
 Jt+slE+S3CRrcgow0s6mG1cP+NzOyDy2tNRT6PUs2PvTE8AUnYoav56mSyM1AU7K9vol
 21s1wXOR5Za88JIEwVr6rYW0P9bR3Q7pZqvTqTzdwtqY44Tx/iHgq7WukfGFiRP/xQs8
 O1og==
X-Gm-Message-State: AGi0PuaG/Nl9mQIz5NdATvbZGVRUE/IfB5FD6E3MppDP4kFDcHa0tZpO
 AVUVluDZUuMG9HZ9Szo5Ad9G9g==
X-Received: by 2002:a17:902:32b:: with SMTP id 40mr249114pld.73.1588270782833; 
 Thu, 30 Apr 2020 11:19:42 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id j6sm384256pfe.134.2020.04.30.11.19.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2020 11:19:41 -0700 (PDT)
Subject: Re: [PATCH RFC] target/arm: Implement SVE2 bitwise shift immediate
To: Stephen Long <steplong@quicinc.com>, qemu-devel@nongnu.org
References: <20200430162828.13993-1-steplong@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <84356e80-96fb-e0e8-9fd1-a380c375680a@linaro.org>
Date: Thu, 30 Apr 2020 11:19:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430162828.13993-1-steplong@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::644
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, apazos@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G/wsp5cUwt48

On 4/30/20 9:28 AM, Stephen Long wrote:
> Implements SQSHL/UQSHL, SRSHR/URSHR, and SQSHLU
> 
> Signed-off-by: Stephen Long <steplong@quicinc.com>
> ---
> 
> I'm not too sure about the casting I'm doing willy nilly in the helper
> functions, but I think they should be ok. Also, there might be some avenues
> for optimization when translating similar to asr_zpzi and lsl_zpzi.

No, the optimization would interfere with the saturation.

The casting is ok except for sqshlu.  Negative values should saturate to 0, but
by passing them to the uqshl helper, the inputs get treated as large unsigned
values and saturate to UINT_MAX.  You need to use do_suqrshl_bhs for that.


r~

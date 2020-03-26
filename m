Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2429830lfi;
        Thu, 26 Mar 2020 14:52:41 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtvWQhEGg+6idy05XAYQ9PRWsfBU8UR391u6opcQO3qle88bZYPTCwmJ75/vRl7LP9F+faW
X-Received: by 2002:a37:4548:: with SMTP id s69mr9584752qka.63.1585259561152;
        Thu, 26 Mar 2020 14:52:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585259561; cv=none;
        d=google.com; s=arc-20160816;
        b=yqS7sbpLyqRh2oYuLXcjGx82X/wj+OfTPmdToQd0Ec34yArphofVzXKzq6r6AJ5PvU
         ZSPJj55hcnd3NzRwRvO6EoRyr8FjdQMXfSQ/tBNAa/FRwPIuraBthYXgo0jr4at80Nra
         6d5qqA/DigG2zq/b2IS/aJj+BDv15A4Giiam9GJDLhrO4/U5+ATDGVFr8qhYP+Uq98iC
         Lau+fUllpmEr1Azs9GtR8AlfwV0NIoQmFq6ZlfGbposfcrGS4U8pQy+uoonipfteoUWH
         MQvh0XbF7hPrJsde+umCEc7vqoVDLUutXcmtki/9Qm/PhaacrZKTpdSN7LamHnl2nw9J
         8csQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=yaPa7TcrYg1l8FgG17gMEiEyPUK625BISB2hlAjbjGo=;
        b=nJ5Ty5YfxTjCuqT2sgMeljaMtHjp8vGCdL990riFOplyLT1nC1nr1AvIxEylH56UpC
         gckfbMTZG/PpJfVSs0vBUhIjsb1eaI31x696T9Fu2VJ5h7HPstTrDVm6QWz1nfrsskQa
         omivJQP7KGkID098WkckjXhMUEb4z8h+LF8OVRgjKeQXQhE6MLfSefBLI5P8o1Yc6Pba
         xBjT+fk71XjI6KjmEXKifmbcteXLnEHVxIrnSlPCgt7L5XEAad1uR1kjdumCundQm4yw
         harYcsHTfdpxyqzru+J8heLlL3O6mgIYNLfsODidIAStxiOt/sHCMTZY52c4EOmc+4JY
         jC3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pPtrXhF+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a75si2115925qkb.141.2020.03.26.14.52.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Mar 2020 14:52:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pPtrXhF+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jHaQa-00022t-Jx
	for alex.bennee@linaro.org; Thu, 26 Mar 2020 17:52:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53776)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jHaQL-00020w-E3
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 17:52:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jHaQJ-0002dn-BY
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 17:52:24 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:41950)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jHaQI-0002aJ-ET
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 17:52:22 -0400
Received: by mail-pl1-x641.google.com with SMTP id t16so2666693plr.8
 for <qemu-arm@nongnu.org>; Thu, 26 Mar 2020 14:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=yaPa7TcrYg1l8FgG17gMEiEyPUK625BISB2hlAjbjGo=;
 b=pPtrXhF+oZkCNSOvMUnKQ2aMgv2VHjHDvr7/WcAs1miRGNS4QYbFzV94I4WMJiZrM9
 bNkdOHS5CRJScz+Qgnl+gdiwVCyKqiZZ4Z/u83DMeUOIMkKju7azGbrBqGNOvZi8NEH4
 jpD6q1EbLvugmrmVfW2tmgGuuJFHguNPS8BXi58+TpeJrpGsMfJCtIxThdRngqvjLWo+
 fS3LH40ajs76m3InZYkbj7Ib+FpaZQQH3Op8wkBPVLPbE2fTqtkyU19jsHC7gosGiPUp
 /Uu/7X4xi1VBuKEXGSqNINhTIvokHyatTEJlNWzrVgVqyJJc40olNucQR5oKdIJ+Hisy
 Kchw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yaPa7TcrYg1l8FgG17gMEiEyPUK625BISB2hlAjbjGo=;
 b=JRgx20utKJE58d/hNkv6OyRHZZlAilNlAAAa6L/RHykJFHsnv6dErPrLjYgIeJr4ex
 3MZh90zuRBDedt23XB+YY+m/68p08T36rfR9zHjfKeOI2Ffi/K09GefN+89TcWQo0lYa
 qW7/VcY16oVVvSjVRBjE20k5iONBCVfw8RPL884Pqxu7h4HtgeCKOo3iu7hZIy5cBQ+p
 xx1NQQ11dmEuiPr0H46nqD10r27v/VzF94w5AAFCpfjwNR8hb2aE55hP6GOFKl9Kg9VP
 WBa1e+NKwDv+4Gv/prdgeCOkEjy9js8dhfGq7PVnWBfShPWSzIt3Ea+HApnAL4ktrVSr
 U2qQ==
X-Gm-Message-State: ANhLgQ1DhcKStyvRSdBy32avg35ypBoYBZEEHkYcLSdsu0E5H+uugf0K
 ZgCkUIuFIUYTRoU3bpmBqU4sEw==
X-Received: by 2002:a17:902:ea8a:: with SMTP id
 x10mr10408724plb.328.1585259534941; 
 Thu, 26 Mar 2020 14:52:14 -0700 (PDT)
Received: from [192.168.1.11] (174-21-138-234.tukw.qwest.net. [174.21.138.234])
 by smtp.gmail.com with ESMTPSA id i14sm2400608pgh.47.2020.03.26.14.52.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2020 14:52:14 -0700 (PDT)
Subject: Re: [PATCH v2] hw/arm/collie: Put StrongARMState* into a
 CollieMachineState struct
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200326204919.22006-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <eac3876d-c1a8-5bb9-8368-1eb602bafc64@linaro.org>
Date: Thu, 26 Mar 2020 14:52:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200326204919.22006-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WjZ1QL+FOLlE

On 3/26/20 1:49 PM, Peter Maydell wrote:
> Coverity complains that the collie_init() function leaks the memory
> allocated in sa1110_init().  This is true but not significant since
> the function is called only once on machine init and the memory must
> remain in existence until QEMU exits anyway.
> 
> Still, we can avoid the technical memory leak by keeping the pointer
> to the StrongARMState inside the machine state struct.  Switch from
> the simple DEFINE_MACHINE() style to defining a subclass of
> TYPE_MACHINE which extends the MachineState struct, and keep the
> pointer there.
> 
> Fixes: CID 1421921
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> v1->v2: folded in the uncommitted change that fixes the
> arm_load_kernel() first argument.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

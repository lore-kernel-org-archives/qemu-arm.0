Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2221263lfm;
        Thu, 30 Apr 2020 11:37:29 -0700 (PDT)
X-Google-Smtp-Source: APiQypKTWkGeSJlJQQwkspnIWs4nLVbsNmKPeRRp1AeuZU0vREyUtDOzm4r9FYmvhAVvf1oR7Aqc
X-Received: by 2002:a0c:e786:: with SMTP id x6mr249335qvn.11.1588271849413;
        Thu, 30 Apr 2020 11:37:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588271849; cv=none;
        d=google.com; s=arc-20160816;
        b=G4sqkFOTymiRY0YhjtNwBXiz/3QiaDvIWVrHxQfUsBrpNOP31ljZQZvUCWpGMe7vgV
         +S4gCLrjqOp0sODVosEZkhZk3lhfT6H4827K1jS9Pknytx5ZEmTA4+ioAO8j7dHoOB8X
         w3XrreSNf3/yE2T3UEe+ebBkdhDZbKXEiJqbmD4TSAKp3DJ/iD+eXfigbMZVVyUDYJgO
         4qjk+J5XbGE31ERN38knjjdrFrHIvpd/z8ukDhguGmlBbVUkIv3RDfkpHgWmRNmMYcEV
         oRpAeQn+wKvYg8rEYdlEJ+pdDlYD2UA9wgF1HHn/7QcdFDn/QRpovis1/2zR0GqWFnXk
         2xEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=zWIIrt8aiUHc320gKFzuO0QrYqzyBKWJBFr0fG5q2Q0=;
        b=OMIhIaPHodiBdnWs6l6rstn+KWSYsVJBNZdhCWBSYik675E76tn654QTn4VS/Y8qXA
         aJG3xOHPUpuHe/nZ9zz5uMBKdmaoUb605BpKZxaiIPTKt028dh1+TiHV5doro5Msb+YZ
         qfdhhKnIp2O+oQbvs7qquMyUpap/OZBMywdJL9fWnaB2mH7CR3GXmNOu0wodq2TK2qbK
         l4tUMpFaKdBaGdc4HsDI0k+8YfPXf3h4EPIe6zYVDLHxCrJ5DfreQYZz+H755fIdin41
         TtB/V9bPD+Vc7AkslrJQaIZpavWjDw7ms44d/Tbqqt6jlfizrjZ9FHPIamyd2v6gTbd7
         9WAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gIZu7cvz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id u199si216285qka.202.2020.04.30.11.37.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 11:37:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gIZu7cvz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUE3s-0002ve-RL
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 14:37:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37744)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUDoT-0000ov-OS
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:21:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUDoT-0002ku-2v
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:21:33 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:43492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jUDoS-0002e9-K9
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:21:32 -0400
Received: by mail-pf1-x441.google.com with SMTP id v63so195442pfb.10
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2020 11:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=zWIIrt8aiUHc320gKFzuO0QrYqzyBKWJBFr0fG5q2Q0=;
 b=gIZu7cvz4COEaemPOK/BFoeGSI5clOSL2C4omleJgA9HNHRopK2tAf8d5j+ulohenU
 9NONpdp62mSkD+l76djYo78spKs0/fbZRXFlX8oIRkaCrWOMTMkm/XkDicDae6RqL7c6
 5eStriPu5FHlZ18F6fEXxC//tUtanGuUBiyZMNfy/TOGAOz7KUs8ljpWLXCspuiy8BCW
 BzsQnnB7CpXnXpSAK5qQJfY1K1MUWhvOFp25CL7vrY+DupuACcUSAuH5TwaGPJYdKFCf
 yg2x8ONmS2MmB/GnUxSEXmEVZHa/7lKk6zWpHRUUyQ4H8URi1+0V+XmQMip/IIUAELhg
 QRNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zWIIrt8aiUHc320gKFzuO0QrYqzyBKWJBFr0fG5q2Q0=;
 b=Pqud/0Z1W1Mqco+BV26GkXtAAehQa//hSxQT0pQNFALsFFjCOG/houatiahXge7FT8
 sfZHDqAqM58IbYpucMpLIU1Y7D6pdsMyVJXfd1JZHI9/iIn0uahEiYCHflCWJlU6O5V7
 oa8IEyRWERJx0f5jP+/lPXES+hcXZPM/Xa6mrdLoQKcwCkciG7j7aDdm6eol4fIwyGHE
 lWp7vQ7uu4Muy3DpvwAWrYYK4hGFiy05Iqv7IHKbinojnQ02Z5opq+bIyeocryYKaCQN
 gLfoL1YKPCWSMWoiJ4UDSz7CrpGVz8BNt663kdLnXPqA7rec5Kbj6oB61C1E9T1HBUrO
 8Jnw==
X-Gm-Message-State: AGi0PuYJWu2IEQ30KyxZJXJY+dcShP68laGXWhl6C0vDyfK2ENbXCCX3
 ycg95QcMGzYsDlLBhnAw7nzEqw==
X-Received: by 2002:a05:6a00:d:: with SMTP id h13mr24531pfk.254.1588270890890; 
 Thu, 30 Apr 2020 11:21:30 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id k24sm378820pfk.164.2020.04.30.11.21.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2020 11:21:30 -0700 (PDT)
Subject: Re: [PATCH 01/36] target/arm/translate-vfp.inc.c: Remove duplicate
 simd_r32 check
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200430181003.21682-1-peter.maydell@linaro.org>
 <20200430181003.21682-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ef477a17-97af-3883-5295-937068d81d03@linaro.org>
Date: Thu, 30 Apr 2020 11:21:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430181003.21682-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::441
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
X-TUID: OHcvqAzG8UPE

On 4/30/20 11:09 AM, Peter Maydell wrote:
> Somewhere along theline we accidentally added a duplicate
> "using D16-D31 when they don't exist" check to do_vfm_dp()
> (probably an artifact of a patchseries rebase). Remove it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-vfp.inc.c | 6 ------
>  1 file changed, 6 deletions(-)

My fault.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

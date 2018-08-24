Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1908861wrd;
        Thu, 23 Aug 2018 21:36:46 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZVl6zAASOOBo5fBRXzkcAOF1N4j/tcGswME4JzjReP9khOP9Hex8lJp0eIiX7WVQI+K0bq
X-Received: by 2002:a0c:b542:: with SMTP id w2-v6mr39430qvd.156.1535085406489;
        Thu, 23 Aug 2018 21:36:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535085406; cv=none;
        d=google.com; s=arc-20160816;
        b=PzVyOOMbr3a9wd52rjDiPPbtPfBl6aRVVEhf8xVFTAH4Rklpu3okIS/tzuHYZu0dNr
         jNEryu9TcTiEjkJFROoAicIXXnOPH4U6gYObmaKEhBRACgtqxNNxdIv3h7//cgJGXebc
         FnulP9+NJtQyFIybikF8TDZg8r9PYJMDWbfnoOzPHmibyHCahv/LgBAEOEAx0q+Jd7gL
         w0sQF0nfu3hiaUXmbH+1mtSioXO3yJmv++jH+NwGRLMrrZS/0HAeDj3io/8zjcbjvVha
         QvduwJkJn7Fvud/sB/wcMECwHKsBE/AlWQb5bw3dZijDCLnu7NhDBx5hU2DEKe5snTJ5
         L59g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=Ai7T7e9X3QafAwhq70lXJRW69GdXCjFiUAObOPIsO7M=;
        b=S54UI1rHoz7cFLgWBXEQtQQ789SaIqRv03jWI8cK9GAnCrne136HJWyn+Op5hPjyUH
         fcZQBiA7nwAG59sssmxsvEBPtkvI20X5hDmnU8Nh2g2C10CZtCnTeRvmHXP7pgN1azDH
         BB/h+5MgngB3/yKQ3JC283aDwPKVfS5nLwSMbFo/CWBHsgj5mK+ww8bUWUDzL+BDjJoU
         vM05elr+lfkoOo1jxjXy3FSVTiwevdcGYnPUdApeEEKj7CMcRwV0Vto8TrbeI+51KTfS
         AU5/1KE8OCLup9ZlNzDOuGnMzOzSN4gNx2xwuMzWdsEpkCw85MdrANhEwnTBINaw7lfg
         RL5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Lpnup7mn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b11-v6si5918520qtr.367.2018.08.23.21.36.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Aug 2018 21:36:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Lpnup7mn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39822 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ft3q1-0001Ei-Ro
	for alex.bennee@linaro.org; Fri, 24 Aug 2018 00:36:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45391)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ft3pn-0001E2-30
	for qemu-arm@nongnu.org; Fri, 24 Aug 2018 00:36:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ft3pi-0008OL-1S
	for qemu-arm@nongnu.org; Fri, 24 Aug 2018 00:36:31 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:43381)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ft3ph-0008Nv-RK
	for qemu-arm@nongnu.org; Fri, 24 Aug 2018 00:36:25 -0400
Received: by mail-pg1-x530.google.com with SMTP id v66-v6so3700324pgb.10
	for <qemu-arm@nongnu.org>; Thu, 23 Aug 2018 21:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Ai7T7e9X3QafAwhq70lXJRW69GdXCjFiUAObOPIsO7M=;
	b=Lpnup7mnALaFNECfrQOId+APnbFdfUQR/Ph5IQo62R09rDAQk6oIR4EEu9LzKgnSBn
	U6YrHDuAhwV6uWMuWZUUVKOVdHaBonGZybvL12lKmeVtFP+7GRib70qgpiy9irDVGqKF
	OF8FszII0ZxyNdlmzx1qHk5UvVrdfHb/LZbNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Ai7T7e9X3QafAwhq70lXJRW69GdXCjFiUAObOPIsO7M=;
	b=M1AavZjG9+ZFpA0+vvTxdT12OsjUfsoDcCZdZB3DM+c8QB9iGks9lxI8WdVRXtZvy7
	jEzvGyCLaA973MsC0v6S2QhBLDnqAr/k6jjiEPws10a3Xi9RtqSBTzY7Ekuizwv9vh4B
	DVHVj597HpRVkrGUeLDzFnyC63iGGNOgm0ZFjvdKI0lgBrd4ZcvKIoAxnn5zW2OtO+IW
	6FcfJnNYAKSZqwN2/9abjFegqnvw33QHed90GyNELEH26QdST1fuRZ8Z2j97Lshlgk+N
	eHd/VFs1pD3C2vmJTi+I647H3RultMhkGP/sn6Zest2BWXmifaK4JbumjcJ7Gv/1yIk3
	RmPA==
X-Gm-Message-State: APzg51AUlN+9QbdpSE6tzm6WRyDGkMQQ7pUmgcm0qikpC7uJoPzSxKp5
	j8zkRzUg7nQxXIkYiOO8y7zDRA==
X-Received: by 2002:a63:5964:: with SMTP id j36-v6mr38022pgm.222.1535085385001;
	Thu, 23 Aug 2018 21:36:25 -0700 (PDT)
Received: from cloudburst.twiddle.net
	(50-200-230-211-static.hfc.comcastbusiness.net. [50.200.230.211])
	by smtp.gmail.com with ESMTPSA id
	r64-v6sm8720081pfk.157.2018.08.23.21.36.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Aug 2018 21:36:24 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180814144436.679-1-peter.maydell@linaro.org>
	<20180814144436.679-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <315f0ccb-2da2-3df9-4eec-5c591f29a708@linaro.org>
Date: Thu, 23 Aug 2018 21:36:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180814144436.679-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::530
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/8] hw/misc/bcm2835_property:
 Track fb settings using BCM2835FBConfig
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fNEvpzVbRvwr

On 08/14/2018 07:44 AM, Peter Maydell wrote:
> Refactor the fb property setting code so that rather than
> using a set of pointers to local variables to track
> whether a config value has been updated in the current
> mbox and if so what its new value is, we just copy
> all the current settings of the fb at the start, and
> then update that copy as we go along, before asking
> the fb to switch to it at the end.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/display/bcm2835_fb.h |  4 +-
>  hw/display/bcm2835_fb.c         | 27 ++---------
>  hw/misc/bcm2835_property.c      | 80 ++++++++++++++-------------------
>  3 files changed, 37 insertions(+), 74 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


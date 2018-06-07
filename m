Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2408816wrq;
        Thu, 7 Jun 2018 11:11:44 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIDmswcNGZdwyJNooWNXNjAR+cRb2E9mxr+bpA4ARrP6h4iiIZDRHzrvehx+ETbiBC2HYJ/
X-Received: by 2002:a37:2ba4:: with SMTP id r36-v6mr2554380qkr.300.1528395104311;
        Thu, 07 Jun 2018 11:11:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528395104; cv=none;
        d=google.com; s=arc-20160816;
        b=DDXtstsKeQJJSQ94nX0GRBsGe33nPSGcrNVS8enFJHBRy8sEntLzNh0LzsQut4Hir+
         2LBtEpf1JpLHD0vDEFkyVmVZxu0XHXAoUQCfT9Pam+I+gcMTNsg/Ouvbi5NWC+fvwZZu
         1ehwNUyyabOd7kTYJvIi0tktdqAhCRKxZKbzh3QDT8kMs/ylRxwNtIA+qKEJD5lgbQAn
         CP/5HnNUiEa8lzmhlfUcahjRGwY9ybkvZSDwgW9HagvL9Ok2Mz8p6Ik+u1OEKt3SBetC
         4pOeiiSOqMDQZo76IWk7m6S9QS9a1/UdzCSzZmR3/ZBd6U4Bep90jRUjcEL3eSwq+C4m
         wisQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=KGfyVZqpx1tNEjCgYyo0+//kYI3n66OT5MQwffKL1Ug=;
        b=iMQvwq2xa+nSNW+R67oLjbZBxvZyPjTDFeuigxXLvQHrimj9xnMRZIkagNZXYj+Q3E
         MezCyU2I5v3fbX1HszQAPciJPVz6Yxvzqp2UWZaZcp8hCjnLh8q6QqnML2+DoPYbzvji
         iLkPYU4tMXZoRPWOEOz2B7euhNk2I2qA1OVeY7lvuGZsHnKIUiHivb303yEYFnzojH6T
         k2e8NOP02Bpestxs32q0X7R12mBVGHdJXbwZxlTcE0JphgF6UkDOnETgtfROZqdpNVRp
         9ToXTLOlREA0Io7kp96vci+H/DDD4aJDfBdBytqELdbaAkue+08xIKO/90mVoZdluyMG
         UGYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=G1wc7rJ6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z184-v6si273819qkd.325.2018.06.07.11.11.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Jun 2018 11:11:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=G1wc7rJ6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59626 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQzNv-0005Z7-RQ
	for alex.bennee@linaro.org; Thu, 07 Jun 2018 14:11:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46637)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQzLe-0003oy-Cj
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 14:09:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQzLb-0005R6-4d
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 14:09:22 -0400
Received: from mail-qk0-x22b.google.com ([2607:f8b0:400d:c09::22b]:41151)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQzLb-0005Qx-0A; Thu, 07 Jun 2018 14:09:19 -0400
Received: by mail-qk0-x22b.google.com with SMTP id w23-v6so7139890qkb.8;
	Thu, 07 Jun 2018 11:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=KGfyVZqpx1tNEjCgYyo0+//kYI3n66OT5MQwffKL1Ug=;
	b=G1wc7rJ6Li0yDw2wQSBXsGIqNTuOCig/JarbneCEGwMhd34IlqensPHXCJ3m9hPMRl
	YybtAeSubgctDLmjCRX061Xq/52X1gthBGToT78Pho9N5dGUFB5OkOp5tt/64zNPVbAM
	LgHcFg2/fWZY3Kj7Z1n6NcYr/fREJdDrA59Uz10CiJ4qsWlOwUw3K15fnyGWgdC2h59+
	y4fiSgqEBNEoy1zjPjA6hK+DQY7EwcxAmanT2BTK060Y4ojLH7SRTu2DoZXHuApL4LTv
	kAa8LQrI8LxuN9LxTaykVi1vgJcpSZ1UtC6CuuUi7bPjU3d86pezYDpXbxNmyqYVlNiG
	/eVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=KGfyVZqpx1tNEjCgYyo0+//kYI3n66OT5MQwffKL1Ug=;
	b=BBz+/SRIPJfRv8iaDbM2HaRmGOJ1WgPXI+8FCF1xnGJNa7vuxt7FYhCPIPA0NpEVWP
	cdcZRvveNmBMCPvc05oJ++STxa4YVPdjsRS15yW06HAqtjCze2pSfD5FqybylhHg10hO
	70g+1Uf88DcQQh6Bf8eY9NhBghKOlSWFLODXNr8+INB2f8E3m94gFIhcUYdXC0IyGGvE
	xwo/wzs3nvRX3IiJqRakP20s1fL720SN37L+JXT+UuoNg/PbI+zreeLXQttjsgwMaaH+
	UCuCe+hOxAbeEohmV6W+eoOP040cpMLWiLipd+7jVb9K8DSzcgncZtvyT3F1dhayhdD0
	0GEw==
X-Gm-Message-State: APt69E3rJNCCCZfCxvTmj6B6EH1RUllFI8xZ0OS+BZMK45G6MuArVyRm
	Uy/LBuQI9laI6MWS0fGfloU=
X-Received: by 2002:a37:ab17:: with SMTP id
	u23-v6mr2503624qke.407.1528394958438; 
	Thu, 07 Jun 2018 11:09:18 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	f99-v6sm29846782qkh.85.2018.06.07.11.09.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Jun 2018 11:09:17 -0700 (PDT)
To: Alistair Francis <alistair@alistair23.me>,
	Peter Maydell <peter.maydell@linaro.org>
References: <20180607180641.874-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <db2a6b88-e7d1-fd0b-b790-76436dff2f35@amsat.org>
Date: Thu, 7 Jun 2018 15:09:14 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180607180641.874-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22b
Subject: Re: [Qemu-arm] [PATCH v2 0/7] sdcard: cleanup the SD_SPEC version
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, Paul Brook <paul@codesourcery.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5V11Ue2fZvjN

On 06/07/2018 03:06 PM, Philippe Mathieu-Daudé wrote:
> Since v2:
> - heavy documentation improvements
> - squashed previous 3+4 "add spec_version property default to v2" for atomicity
> - SSI/SD patch downgraded to RFC
> - added Alistair R-b tags

Patches missing review: #1 and #4 (#6 being RFC waits for comments).

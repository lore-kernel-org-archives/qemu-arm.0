Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp1070208wrq;
        Sat, 9 Feb 2019 17:24:56 -0800 (PST)
X-Google-Smtp-Source: AHgI3IY1Dqml863lqn2XuATYI+Zwyu11wVMfFgq1sCPCB3IX3ELwLutaLW1NMf2vtaLQEedafD7a
X-Received: by 2002:a5d:690d:: with SMTP id t13mr5848112wru.135.1549761896104;
        Sat, 09 Feb 2019 17:24:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549761896; cv=none;
        d=google.com; s=arc-20160816;
        b=P7VtVq2R+OYHvVAEqzxiWrd04SW36dZSK/IoaZ2oiZ+MTd/C0DSez/y+XU6LVCb0HJ
         dn94xXYbXo2sPJXJSHZPKM2RPk4AVKFRJMmDnQuN+xwW8QvXQ8oUDWrayPWi6elm5gvH
         GzMxhNJ8Z7ZOBxaENKc1hcS5mxak4iVL8OX0BHTu7CxrybqSsc9/DQIpKU8+oa1T471h
         L+cw+RnyC2TVc5ZJy+v4Kc3+9NVH9FdHxj1XXk+nWLFi/QH2m5cebgyON0vkdA81rrCC
         Oz288LPwXQHARlkGEFOdfc5CM5WhQlweW6BJjp7dJye3PpapYjKGAknmyC2HcMFL+bd0
         qmug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=qX7XPwGXJD+FNY65vAZfbtPBMZZyZnNY76cwRDxLbzY=;
        b=UyOR9fwD/y550bJCDlwhydnOcvRjsIgE7Ym95wmvMoHQI9ezUQZVVrdRq6Mts5NcKy
         07KtyKZMVNX9VDv6rgOIhUxiinFPOAeERw0zwAeDeqw6cIZ9eM4x6OQjQpKdlNamCDh1
         qtbDG58XKd7k/HDyNiaP/0Ms5wPfrZnR1wVFJgmFSyXKKePdgUi4uOHeCb61ZR1nZKiN
         EwklnL817ggFG2gh1PZPCYZiGXinTWkfvsrrCNt4VECc0sWuanK3+ojM20J71zVZmWNa
         tkxXdFcirk2+m6mFHS4RyK/2ylo3c8ObhWRU72tor7UCq97W/JdgjYNF9xhgtxSFlSIb
         6aXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rvluJwbg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i18si1550170wrm.102.2019.02.09.17.24.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 09 Feb 2019 17:24:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rvluJwbg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:51950 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gsdrb-0007l4-72
	for alex.bennee@linaro.org; Sat, 09 Feb 2019 20:24:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39182)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gsdqW-0007Nx-SA
	for qemu-devel@nongnu.org; Sat, 09 Feb 2019 20:23:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gsdqU-00064n-MX
	for qemu-devel@nongnu.org; Sat, 09 Feb 2019 20:23:48 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:39741)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gsdqU-00064S-DS
	for qemu-devel@nongnu.org; Sat, 09 Feb 2019 20:23:46 -0500
Received: by mail-pg1-x541.google.com with SMTP id r11so3287915pgp.6
	for <qemu-devel@nongnu.org>; Sat, 09 Feb 2019 17:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=qX7XPwGXJD+FNY65vAZfbtPBMZZyZnNY76cwRDxLbzY=;
	b=rvluJwbgenQrZQwmEwTV3pw94pUuirq0gYkeBOLrrzVYs52OpxZ42DXAQp1FxunVoU
	rQXiEJ0VYpPdJrT5M5g7P5b5jld1xOSfOrUdH5G4Nqf4K1yifYNkR28w1f0nwwIYqvWJ
	A5kv5WdhssS3K7/oNgxxMHQGlhUaITKwcXDp0OCVcezi0hIeFPpA6sWeXEYra2brJKNr
	7ugm+42chvz0VKDGO+vQupVxJcKVb2vcvRMqlbEuYj4t4yAknCXVxOLHvrEZfg0epmAL
	RFVvBJdnItFe9kEwh1CE8JIu+CrXxTX4jNx/zr92Mqw5IwCJWsK9LWkEz31CgKE75xNq
	18OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=qX7XPwGXJD+FNY65vAZfbtPBMZZyZnNY76cwRDxLbzY=;
	b=BpoP5v0uyJFILg3qU1W6JadGUDM4CP8Ie3MJXCUeiSBs5z1mUt7uvkW24GToaWxcgb
	1EWuEZY2uoxh8qN70QO1XCJU4b0lyes7BVbzVPGQrb007WOHW9RpejfVdUo+LV9ngIrf
	uVHj9vtFfrI8fk88hjAWGBLUifU3MlQdZIzE1p07maFD9SeB9/aPO1inlECJJ6fRWPIM
	WpDMqfWPtsFl84Cbf9d5vtXgkjA+SOUpTHaQEu2p3eMgBx20q9QaSEJNFZyDtSkeNYoh
	Os6hFy0LNjXaZjHn+SiwQb5wpb3dp9QB6LGQtXcPk2XxegbYpVkdS/sPkVkXuTQUzN8k
	VQTg==
X-Gm-Message-State: AHQUAub3G6nMNjoLoiPyKlUZoiT8KnWsR0jjgHv1lVABPp4gEPAfEdTE
	X5OgVDnrPbeKnvRiYUgZYq/9NbNPtwk=
X-Received: by 2002:a62:4587:: with SMTP id n7mr29860549pfi.118.1549761825315; 
	Sat, 09 Feb 2019 17:23:45 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	l22sm8150301pfj.179.2019.02.09.17.23.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Feb 2019 17:23:44 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190114011122.5995-1-richard.henderson@linaro.org>
	<20190114011122.5995-4-richard.henderson@linaro.org>
	<CAFEAcA-BEfqu=BU-2y+8dUBdXsyC4n2zhZm5nZ1MofUj3cE2Lg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <c37e6649-b2f9-88cf-913d-d0394a635045@linaro.org>
Date: Sat, 9 Feb 2019 17:23:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-BEfqu=BU-2y+8dUBdXsyC4n2zhZm5nZ1MofUj3cE2Lg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: Re: [Qemu-devel] [PATCH 03/17] target/arm: Add MTE system registers
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rlgYgzdUDFpe

On 2/5/19 11:27 AM, Peter Maydell wrote:
>> +++ b/target/arm/translate-a64.c
>> @@ -1668,6 +1668,17 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
>>          s->base.is_jmp = DISAS_UPDATE;
>>          break;
>>
>> +    case 0x1c: /* TCO */
>> +        if (!dc_isar_feature(aa64_mte_insn_reg, s)) {
>> +            goto do_unallocated;
>> +        }
>> +        if (crm & 1) {
>> +            set_pstate_bits(PSTATE_TCO);
>> +        } else {
>> +            clear_pstate_bits(PSTATE_TCO);
>> +        }
>> +        break;
> Don't we need to break the TB here or something to pick up
> the new value of TCO when we generate code for a following
> load or store ? (TCO is self-synchronizing so there is no
> requirement for an ISB before it takes effect.)

Actually, we already break the TB here by default.


r~

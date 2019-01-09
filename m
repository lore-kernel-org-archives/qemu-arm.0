Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1062994wrt;
        Wed, 9 Jan 2019 12:54:01 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5ea7PRq6WYIVyUN+PUIzQUWXIgl0YGH4+jxci0HJNrCwQ2mfW+aj9T66EhjiIvKBPNDGbs
X-Received: by 2002:a1c:4681:: with SMTP id t123mr7068213wma.24.1547067241674;
        Wed, 09 Jan 2019 12:54:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547067241; cv=none;
        d=google.com; s=arc-20160816;
        b=K55vOGDfS0NhpZB85hvw+qm2Bz1PdovJZ+rIBTs9jJiCybQFV+m5onpU3y3R1LmGJl
         rIHvYoeB6X1JNhc4+q5RVJyZPpFY476C6C66++e3LL20nxNlgWMXSCu2My3TLike2vtJ
         eQrvEb3Ol8tUsEVsfsmpp8DS0dmM2b7EgEj1HqMM/mvmppbD3UqrMRvWPazQ+uxuGzC2
         ABlPeZcxbl6sEasSWwYFPq80V6DYPRvTyh45l0vbYpcpg5GmYqrEbPdsxDPL4QHUVU2F
         zbPMSB0pDgqfpuUAEAvdBNcglf4Ikuj2fsVZOJkLg+iFiQqI90YHSsdVoeRyMd4Wezfv
         5rRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=BgFm2raKbWWjuaSWXwO7wdO/flI8JlY8g0B2LLVnfLs=;
        b=VDBPf6ZXcCeu/YVsWxXrOrrUoCIzs5Pn+rM3hlZzIkSlHEroIUyWJ7Bi1lqNFY+0Z3
         0JqqFIhJzvAd7SfYDqfNtITLj5qfSreib4IE7YYsCb73yLA2spLNbTX0HIvspmF5PRZy
         vku+NZu7/z2dmuR9GWhTHAhLz8tcJRm15/5wRhwbTbJbgVguibFXxF9rNxiBy+JceCpW
         UUrAAyDLhK9j1qWQYV3Iysy36BAIGWXF3XfwQptWMhOrNQOUq8EeinHrV+I8Cun0H2WY
         ETZJDHQbZWbdpg22i2K58wPByfn5WkvtGcs7xFiGtVkHCtFxHsakN/e7Z8qBfddtjTl/
         S5DQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ho0txyN+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b6si2654872wrp.431.2019.01.09.12.54.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 09 Jan 2019 12:54:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ho0txyN+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:46517 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ghKrQ-0001Vj-P8
	for alex.bennee@linaro.org; Wed, 09 Jan 2019 15:54:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60502)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ghKrJ-0001VO-5p
	for qemu-arm@nongnu.org; Wed, 09 Jan 2019 15:53:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ghKrH-0007UE-Kr
	for qemu-arm@nongnu.org; Wed, 09 Jan 2019 15:53:53 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:35534)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ghKrG-0007Qy-Tj
	for qemu-arm@nongnu.org; Wed, 09 Jan 2019 15:53:51 -0500
Received: by mail-pg1-x544.google.com with SMTP id s198so3832407pgs.2
	for <qemu-arm@nongnu.org>; Wed, 09 Jan 2019 12:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=BgFm2raKbWWjuaSWXwO7wdO/flI8JlY8g0B2LLVnfLs=;
	b=Ho0txyN+wuqcAZK6gGuEOTDQesarTzpq9U0tiEIWU1zV9l/qpKLHL+J2Tgxg7PNdyn
	wECu61GwXo66oKtn340fO6f70yzlCU7FGWc8ANdexc6ux9/g7rMrmse/NVxxeUYHH3Y7
	bnaBcD3e7bDYRlNvtAZ2qhuBYPYPUiPoFcqq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=BgFm2raKbWWjuaSWXwO7wdO/flI8JlY8g0B2LLVnfLs=;
	b=P771OYTggkQqoX4ATDrHr4U6lOa5gIo+7Voo1LH8H9GDMerOhU5mGeL+HDS2hcXbWd
	rFJ85meFOhhyzbY+TfS0q0ZT0srU20XrAWFNt1GZqg3KL16wmdOM0y3iYNOJZiT/Sgpz
	PME33LW9dcaMz1bd3J9xtKj7iFwqgIeNEiOgKQsWhfCFPjZ0nRnIA128tA/UguY8QpbE
	Zjf6Uosg5yYmaIGWMievZ/DBsw5r1YrItfqfxkh/iluLb3mBrY0JiAYkWtfgPo1S0upC
	O97sOyd1XTqzPcmkJF8nT5kyOaB6Ks7p1H/kXXkcFfZIYbO+TKEGWBgWQvMUp5f2yx1r
	WL+w==
X-Gm-Message-State: AJcUukeEt7cNhQ2W8BkHCtrblptz26KlKffTXu2Sx+v+bwci+TFGifFj
	0krDplQCR+oSeaMZRSkZbzSjIQ==
X-Received: by 2002:a65:55ca:: with SMTP id k10mr6770469pgs.448.1547067229760; 
	Wed, 09 Jan 2019 12:53:49 -0800 (PST)
Received: from cloudburst.twiddle.net
	(c220-239-117-135.belrs4.nsw.optusnet.com.au. [220.239.117.135])
	by smtp.gmail.com with ESMTPSA id
	m19sm226466106pgn.35.2019.01.09.12.53.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Jan 2019 12:53:48 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190108163008.7006-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <ebfdc4ad-3f40-a09b-ba40-db18ac5a6484@linaro.org>
Date: Thu, 10 Jan 2019 07:53:41 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20190108163008.7006-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: Re: [Qemu-arm] [PATCH 0/4] tcg: support heterogenous CPU clusters
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	"Emilio G . Cota" <cota@braap.org>, patches@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5Ua9M7bXrfUt

On 1/9/19 3:30 AM, Peter Maydell wrote:
> Peter Maydell (4):
>   hw/arm/xlx-zynqmp: Realize cluster after putting RPUs in it
>   qom/cpu: Add cluster_index to CPUState
>   accel/tcg: Add cluster number to TCG TB hash
>   gdbstub: Simplify gdb_get_cpu_pid() to use cpu->cluster_index

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

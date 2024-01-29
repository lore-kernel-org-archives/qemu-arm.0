Received: by 2002:a17:906:3554:b0:a35:2c0b:b7b4 with SMTP id s20csp1022759eja;
        Sun, 28 Jan 2024 20:23:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFEDwkJInkTCG+T5rb5gSJJ/u4p5DpGkq3lQN137gGMWHSubeWNiKEd/P8M8AzX71SAMcEx
X-Received: by 2002:a05:6a20:3f16:b0:19c:6970:2d96 with SMTP id az22-20020a056a203f1600b0019c69702d96mr1450685pzb.87.1706502211164;
        Sun, 28 Jan 2024 20:23:31 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1706502211; cv=pass;
        d=google.com; s=arc-20160816;
        b=c/oUag873Q9wgMyQAlpfdaqbHKqAVy5JjD3E9x5E+yMZEkCTgo7QuyPIMbJPFijJEK
         rP/EMRL5OqPiRkDgtQO9pAMdROm9c40wMlWKFTWzRRF/ONANtnlAVc8l+RPOWDrjPeyk
         7Ut00sy/jWlKgb9jxD3WmVH5TNtut3Kg8NexNdw3GoDuBsNBqlIIkAXlNSC33hE1GDW2
         tjhNa4W3oPnE7L91b4SkINinwKc5uwqNFQAQeADTOnmCPSZd6jqMt22QuEVrreMBjBwr
         vkwBb2T/RKbeRLpwxcwSj7z6bwhVbY6YagSCrbDLib/fl6K40UISHJyn0wMO/y9ZP8uB
         xbqA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version
         :list-unsubscribe:list-subscribe:list-id:precedence:date:message-id
         :dkim-signature;
        bh=5uujqsJyzrlAFtX8OEePL0GsaYL1U9qL1eWafJ6tdXU=;
        fh=BODjIDCkLXJu9a7sTA6+DISNoD1hOQ0+m8lvYCUrnFw=;
        b=w5gyjeNzBYtAkWU5MBjTEyT/cm4Masm4i/WSLL7rL53jtEraxKgnj8HGq3qG37goHd
         hv3lw/086QfrFRGCeqijDdBRPi/umMzfwxqxkmsbpRfFQydxBZDjqSsZQYmFIuaiIgtv
         2WEB4leBwmn0LZ8j0S3VskIpP6QAmqeLb7LFgCW6bbmqa9zh0dJU8JAHl/6sq73YwGDd
         b5SHTBUO3M6AXTPrtV9Sag6APCDdNNWfIxDjDJlmPByvJ1UK0l8Ip7jk/H7smjM3yUCH
         bTDyn/Y5kZqfOcxXuLYl5ztVAKPy4UcUEHVhyNS3Y6OI4/0vFjvTGXOShCSfA4A6Ni7e
         sF4Q==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XdUSDEMW;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-7305-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-7305-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-7305-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id g11-20020a1709026b4b00b001d6e8fa5b3asi4948397plt.610.2024.01.28.20.23.30
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jan 2024 20:23:31 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-7305-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XdUSDEMW;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-7305-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-7305-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96C63281ED5
	for <alex.bennee@linaro.org>; Mon, 29 Jan 2024 04:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92F893C47A;
	Mon, 29 Jan 2024 04:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XdUSDEMW"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973BD3C46B
	for <kvm@vger.kernel.org>; Mon, 29 Jan 2024 04:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706502206; cv=none; b=nFY5DVNXp2tLdzG6ulPXOjjQlVCDLN8NfYk5Ii8Vw3bxu4BAkYoGfqddsvl8ukRqdIQWIDbDPlrph0o+euE5LsQnOt88a6cTgkKQrGmE+Oz1xEliocdGolpkf3O8wK4jou3Lv0NJymVRW6DIcesER5sWl96rsVz8m1Oba/s9nZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706502206; c=relaxed/simple;
	bh=EHweX3IJg6R13kmwMtci1oskGtROmwKdaJcuSyY2aM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XiK9Aen9WchgM3JounLNwIiBEH96dh0K1FAIY01Mgx1na/4sqs3gu44QyMlSzYzdjWY8MB8AM61WDtoRotj12cImaWncKcctaU6WaOZl86bsPKeD9Ot5ut/xKROCYcBtKfvW1izF6th3Ddi+tDVOeKfFQmIILNJgytGYFcUob14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XdUSDEMW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706502203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=5uujqsJyzrlAFtX8OEePL0GsaYL1U9qL1eWafJ6tdXU=;
	b=XdUSDEMW2F1uIfaHhMslAG1yX8QXC7h4Oz/fY2tsPWPj4S9Nwxl4uZvQjjbF4TJOcWBuA/
	5uCpq9TDROeWxRDd4zpg/DL2yPcx0F3v3DeGj01Br2XSC/avImJQIvIxYUP1hqtexyykSH
	kP5mewGUL+4dALho+WMULhTjAQgetWM=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-kODFdkOMN-yUut-nkq-KMw-1; Sun, 28 Jan 2024 23:23:21 -0500
X-MC-Unique: kODFdkOMN-yUut-nkq-KMw-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-68c4f4dea85so7392506d6.1
        for <kvm@vger.kernel.org>; Sun, 28 Jan 2024 20:23:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706502201; x=1707107001;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5uujqsJyzrlAFtX8OEePL0GsaYL1U9qL1eWafJ6tdXU=;
        b=j6HMjHo0W0wfUN6I4SmjIUx06x3FeqCJRQisS2LZvfkfI4eS1aq39vMws0pV+guVk6
         ZBQ8ybV4WKhwZFypVb6jmp9iHlrCYon8zHp1DrFc72S13echjchKjEwJcYVsYVD4EhfC
         5mO5sIW7+eE0PzyMZBfjKT6H05qORwgW7cBxSZj5o749xgcIFy0DlFqKa2OP9KFgOWYy
         44W6ivA4o3YpZqw9vu2bcTNfJmHAEKXrDlm75ejlT/tK+plfCqstINWtB2cSYJoP1fx+
         Z2HO+iohz/JXkNmlePcaQr6KmsqnZXcZebS/yBrPsoyO+gO3f3488YWSXPCeNfvJTc+J
         SzLw==
X-Gm-Message-State: AOJu0Yynkx2fEhmSJNbvuXhs3TtnWdDJHcb9YMFitLWkQeDRAEe3gebB
	ES9okULC5FR9TP5UW1tQooGAruIT8VGOEcrYleoYYOBnBkOYyt+TkMPdny2m81T9ph9lBiT7yP7
	kzTXbpkveyxNNTa7N26eRskz3AEiyIqOpmVQAGTkCOZ0fhZ8CRg==
X-Received: by 2002:a05:6214:1d2b:b0:68c:50cf:9e1a with SMTP id f11-20020a0562141d2b00b0068c50cf9e1amr884333qvd.33.1706502201188;
        Sun, 28 Jan 2024 20:23:21 -0800 (PST)
X-Received: by 2002:a05:6214:1d2b:b0:68c:50cf:9e1a with SMTP id f11-20020a0562141d2b00b0068c50cf9e1amr884312qvd.33.1706502200787;
        Sun, 28 Jan 2024 20:23:20 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-176-119.web.vodafone.de. [109.43.176.119])
        by smtp.gmail.com with ESMTPSA id ou8-20020a05620a620800b00783fc26a5c8sm698052qkn.2.2024.01.28.20.23.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jan 2024 20:23:20 -0800 (PST)
Message-ID: <862ade57-3faf-495b-a274-c4e9ee7c62f5@redhat.com>
Date: Mon, 29 Jan 2024 05:23:14 +0100
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/23] target/m68k: Prefer fast cpu_env() over slower
 CPU QOM cast macro
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>, kvm@vger.kernel.org,
 qemu-ppc@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>
References: <20240126220407.95022-1-philmd@linaro.org>
 <20240126220407.95022-12-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240126220407.95022-12-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 10fUyLkS0ZEK

On 26/01/2024 23.03, Philippe Mathieu-Daudé wrote:
> Mechanical patch produced running the command documented
> in scripts/coccinelle/cpu_env.cocci_template header.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/m68k/cpu.c       | 30 ++++++++++--------------------
>   target/m68k/gdbstub.c   |  6 ++----
>   target/m68k/helper.c    |  3 +--
>   target/m68k/m68k-semi.c |  6 ++----
>   target/m68k/op_helper.c | 11 +++--------
>   target/m68k/translate.c |  3 +--
>   6 files changed, 19 insertions(+), 40 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


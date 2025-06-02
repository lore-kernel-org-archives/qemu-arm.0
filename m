Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp2610010njh;
        Mon, 2 Jun 2025 01:53:30 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCV3VcoDxLTpz7CxghjFnehpWwlWBJsmk8oTGSYEIJWWDPhs0N3gEtOiKFNkf0fuxA6ilHGHIFjCwuUGRA==@linaro.org
X-Google-Smtp-Source: AGHT+IHO1R2pp3Wb3c5MQ0ekm35chSDhlyGsJ2x2I7DbOoXMMzvCaNnMMT7dLEYZBK4+TXxy5EYG
X-Received: by 2002:a05:6402:849:b0:606:7cbb:d67a with SMTP id 4fb4d7f45d1cf-6067cbbd6d5mr842065a12.8.1748854410696;
        Mon, 02 Jun 2025 01:53:30 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1748854410; cv=pass;
        d=google.com; s=arc-20240605;
        b=lSf+4TYRRQd7OEeDL/Eg6brulpR0a8qPAIvc0Ba+qLP7QTCfQl80uJH5pnZKzlAU6F
         wBMBYwJHgqV4vGgxPVObGGvtnQQSy6IuKv4afFzWcwLq02H5djUl22TWqrcpWTculs82
         acCGX4sdiaCGDvMLbiDj3MyOjdERE5JgLut8QWJrkOmJL5Ney4tg03OgjmVP+j1iM2UC
         go69OeKI5+fHH2mwYKIvznylifu136JzoWWiEw8cd6KUCuTwWEc1zZrX97X+kWFzUEe8
         BJtJBOc5InLHXjgUYw/GVKSnnm3Ujv093X16zb06sYeO+2nMoTmVD2IDOjB6CzaAcaTr
         Dnwg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:date:message-id:dkim-signature;
        bh=KShKhSKBioxmyYMv+moET2Xbnq5CUa8Zdx1SMT4zvyQ=;
        fh=Jr/DsdiDJPIwSDVrJB6JZZX0Kn0Fk1HStsa80J+sA9Y=;
        b=MD/2sH8R571qH7wxFJtaxFq+5GWHSJedZAQbgw9QK6DYrHuf2zFfwpIxV/UFvV71l6
         Ld5kvp9qjeGvay/+JjvZUPA4yK3HiWFEBJVN+H1z3rrJWDD9SbnXZI13TY47wI6zDr1h
         9u139cubFYaFBVTNR8mDM7Dy8kymwogBLCdQexyjxMWJ2ScSPYFy4OhB5N2QWTpzdGtM
         ohQHQyICBel8JdZjTKr8iY66d5ZgATkO/FUQG6O88JCD3nVAMcLeBjM/rcZt2wGF9DIe
         qBGUlbwXZuULmYmF4eXTrtTiGyqz65KagMuwDLrvBdbQzQiHjZXwPbO4uVninH3b7k1y
         uCwA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o4FzJhqx;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-48154-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="kvm+bounces-48154-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-48154-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-60567117f43si6393805a12.262.2025.06.02.01.53.30
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 01:53:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-48154-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o4FzJhqx;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-48154-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="kvm+bounces-48154-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF1A2189BA60
	for <alex.bennee@linaro.org>; Mon,  2 Jun 2025 08:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 705901DD543;
	Mon,  2 Jun 2025 08:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o4FzJhqx"
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB5719C55E
	for <kvm@vger.kernel.org>; Mon,  2 Jun 2025 08:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748854405; cv=none; b=MMnv7EDmgEjaXXho4AewjfYsnVD0AWwSNNFTEY6eW+knmd49qA8Fx+PeXm0yxLtiSahkLVTZoBkjha8iP8a3Cy77ARyo7lN+8vOwWkjnaW6TQ9HN6wGKN8QpWMWbk4l3Cfsmc6uqfqMYXe+QrgPKJZvZRNtMX5wNx687FT7wSIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748854405; c=relaxed/simple;
	bh=uDkrbZ5KTk4urFktx+AkXph012wgFAStNXb0SubE3gw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PGHayFG8sQ3lbm22ckf36hRbXsDPbAN+VMW0nDRz6UrrkjBKozzRF9qY6yHP8vEXzufc0TbO6uvTtcTP2FZHFD/Gt3YU3zKWv8fIc2cyd0KFeRWKV+auTCWYor+tf4MlhfcL4GSFWph0xui/hgDjIaSsWPlOt8ssqvuiwbASrvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o4FzJhqx; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a375888297so2412940f8f.1
        for <kvm@vger.kernel.org>; Mon, 02 Jun 2025 01:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748854402; x=1749459202; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KShKhSKBioxmyYMv+moET2Xbnq5CUa8Zdx1SMT4zvyQ=;
        b=o4FzJhqxTK3j1yEog9reBsNpCd3pSCJWx85/IELbNQb0U2qE1tOS705CNNJEPjJo34
         TZZ1MQfk18P99HRhrTlDQLygMfCVYHmWYNb5J1WykMDGjA89QaLvg9/tD5dB2isEXxgp
         vAqrSeyg7TqYg5KoWNwrDxTKiEO+8R6Hdjg471PTunnpA5JgWEyu1xM+0+HFtSO6fJDR
         6kjscslo2ydDPgmrO8b9wxfC667CU+IeVZYATxddGzEx+RRoc40yMK+bOMfJrbUnpHOY
         I19H9jaQZa7jW2ztII03mp+BVr+gyeFWxQNWZteDsyC1ggL9ODBxPSglju8zeQYGE/IT
         erqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748854402; x=1749459202;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KShKhSKBioxmyYMv+moET2Xbnq5CUa8Zdx1SMT4zvyQ=;
        b=s50BqZaeEIIFFCF+oTqiXUrjxYe649FEDbX0N8FkFz5iAVmy2AY/dnjIBYMpE3qtqO
         Vcx/X/I0jOt5wP9vrlN1JNNHtqLf7xYYzqhRy5wXtVhaK0z+EP1OHUwKF6RKRxa6Db0D
         ZyymQFp8UsPOrd5tBggIOZAsMVyBh3ZqVRUc3Fiq8XteIWjublZzaNIjpuG0pwgqTLIQ
         0boPeyMg6uwdsBrrm1z1DiJzwMcUlx1U3NQUsBO8AayZWN5+Ao+Pt/02Q3N0vABtbqUP
         VVvAeaq/NXmWzQ9OKH5jJ1mznMU+wOAhaaIfsCWH1EyKAFYZCJXbGiwb6EvSOTQrn3D3
         qroQ==
X-Forwarded-Encrypted: i=1; AJvYcCWy8aS7Pm1fLt4zy0vXNjItxERiHBGFmrsMYvUbYgoemiZfqzyAL+al5f5MqVPmmY3xB1M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyiz/wG1BwVk08nJB4moUJfwQp2Bi1ViRELagRGryUDa6h+ppYv
	GrFzU/TdRLwod+cGZkP3WTkMPjb0j5M1RLYvT5nrcQZnBdllgSw/x0sKvBlS9mHGCx4=
X-Gm-Gg: ASbGncvujq0mr++i8dj6K80GGKEPKmbnp0e7jwk9+3SRqHdnOjYcL83sxW9HdfQro9V
	8fGi5FpOH/0axjrO/2HQqLRmgamE6c/adwDwCzZnr2B6Of1dTj9mtcCQ9C1g26OjLZzJYjT5IoP
	U9zEeO6slYyZI2t3NR20mSgW8VmRUYBgAjYwWn5D9sbGY3SWvskNu6gdrWzPjHfciUC8zJHDmts
	gYqXjDKhPEKZJJQ4ILarLxhdq68GHHXDLAYgdBtHdcDwP2HJN4gkvW6uOSmTFVIX7ObZ25VJuQp
	PATW6wcj9f5vUBHMmhVkt9SQ4AEiDFQuVw5dI1KFuvUzHoqd3sS6i77OxFyvI09m7Tu/Gu/Hb5l
	rTxixe2B+GA3pPCKVQz4=
X-Received: by 2002:a05:6000:1aca:b0:3a4:dfbe:2b14 with SMTP id ffacd0b85a97d-3a4f798f5a4mr9455446f8f.16.1748854401679;
        Mon, 02 Jun 2025 01:53:21 -0700 (PDT)
Received: from [192.168.69.138] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f009fd9bsm13896447f8f.82.2025.06.02.01.53.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 01:53:21 -0700 (PDT)
Message-ID: <c2999ee1-c0a1-4a09-85f8-6c10ede14584@linaro.org>
Date: Mon, 2 Jun 2025 10:53:19 +0200
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/27] hw/i386/pc: Remove deprecated pc-q35-2.6 and
 pc-i440fx-2.6 machines
To: Thomas Huth <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 kvm@vger.kernel.org, Sergio Lopez <slp@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yi Liu <yi.l.liu@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-riscv@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Amit Shah <amit@kernel.org>,
 Zhao Liu <zhao1.liu@intel.com>, Yanan Wang <wangyanan55@huawei.com>,
 Helge Deller <deller@gmx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Ani Sinha <anisinha@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?Q?Cl=C3=A9ment_Mathieu--Drif?= <clement.mathieu--drif@eviden.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>
References: <20250508133550.81391-1-philmd@linaro.org>
 <20250508133550.81391-2-philmd@linaro.org>
 <20250509172336.6e73884f@imammedo.users.ipa.redhat.com>
 <91c4bf9f-3079-4e2f-9fbb-e1a2a9c56c7b@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <91c4bf9f-3079-4e2f-9fbb-e1a2a9c56c7b@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: eTYA/bIzzDHM

On 2/6/25 08:13, Thomas Huth wrote:
> On 09/05/2025 17.23, Igor Mammedov wrote:
>> On Thu,  8 May 2025 15:35:24 +0200
>> Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>>> These machines has been supported for a period of more than 6 years.
>>> According to our versioned machine support policy (see commit
>>> ce80c4fa6ff "docs: document special exception for machine type
>>> deprecation & removal") they can now be removed.
>>
>> if these machine types are the last users of compat arrays,
>> it's better to remove array at the same time, aka squash
>> those patches later in series into this one.
>> That leaves no illusion that compats could be used in the later patches.
> 
> IMHO the generic hw_compat array should be treated separately since this 
> is independent from x86. So in case someone ever needs to backport these 
> patches to an older branch, they can decide more easily whether they 
> want to apply the generic hw_compat part or only the x86-specific part 
> of this series.

Yes, it is clearer this way than squashed.


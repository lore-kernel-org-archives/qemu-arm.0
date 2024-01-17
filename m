Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp1664400ejf;
        Wed, 17 Jan 2024 08:46:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGFnkvQ3cbJxqARDK014fEuvGGjbjXNcY+Vvi1bXtWG0YkN1xH3QsFTxsXzOR1Ckhsm8D/p
X-Received: by 2002:a05:6214:4109:b0:67f:7347:9b97 with SMTP id kc9-20020a056214410900b0067f73479b97mr11636584qvb.111.1705510000339;
        Wed, 17 Jan 2024 08:46:40 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1705510000; cv=pass;
        d=google.com; s=arc-20160816;
        b=LZ27pJktaJfc8dPYTlLhHqdTPVTqzy3obEb8s1YWE39Az25+UMmAPDbNJZ6twS5kZ6
         m/yo/DxsUL2w0zBmesRMs0WIFxvmB6Pwg5sDWI37Hvdysa1tpck0UYiGyO83cRHCmmyk
         bqAAZYI3lhkQau44z0S/yvVxcmcFv5wnImWwi2RxkpIQEbS6Qcgip91KEgHgbIpXuHlp
         4m1CV6mD8TyXfaSxJPO2MD21jCby+NUqU/mGAQWhFi4wEZEA+Dnudr+wGwjK4yKG4Mdn
         7Su61XmvuhDACnrglOPsrBo6BRzBUOGtnb0JZTlP6XJGQYKn3I+LJX1bIyZzJewxOcKO
         Igow==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:date:message-id:dkim-signature;
        bh=Cd3Ose77j/HJBnKN6w+dtcgDO0iKk1wmfevfCIa9z2M=;
        fh=usz5duwYpzgw5srNAwEB1OaomkoA9IGl0mtNh7aMRZs=;
        b=CDONnwMiF46oHJbksnFS3mHjWW2T3YChInue7xxiG/RDsCuQ7ouIwPm4IhwPrpuLbn
         cEK3MssUCMskfhpEjRypStzE478tnEZygHpueJg35lHgQy13zy6Kb/USKZkT29mCN8ZE
         LELJLCGBX0lfJwgCAU0fe5/y9Lq/eKlCRBOCduU7dam5HWqQRGqaA52gTDKJsvLzD6wo
         tErahHDgnVR+F73AODDSLpcjQ1gAyL3TznvY5bvDGN2CPv1HLTzG4Nfd4nTJojY2U1u7
         MJhjcRsjpEYtiy6mH0Xx2tQUlkoYhCEpHfC3YfyXZ64FvlImkTIVzIUf+9nso8KpJpYH
         6MRQ==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=etD+PZoj;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-6402-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-6402-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-6402-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id p6-20020a0c8c86000000b0067f8e283472si12076996qvb.491.2024.01.17.08.46.40
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 08:46:40 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-6402-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=etD+PZoj;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-6402-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-6402-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F12161C21423
	for <alex.bennee@linaro.org>; Wed, 17 Jan 2024 16:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 940A4224E0;
	Wed, 17 Jan 2024 16:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="etD+PZoj"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146B3224DC
	for <kvm@vger.kernel.org>; Wed, 17 Jan 2024 16:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705509988; cv=none; b=OkhhuMthvXvpWB+zfR0mqAtH/Z4pG4VGLjaODlgqGsSgC+hrupVP+G5hNHVBpbPup4P2ikiI8JacOsne7fAoW7QgNEUN/7LhMg0YPiKblUawiViq749NtIyXuKNctigK+lw5LlyiWiPBynwJTv+1w0h4enmSG1xf9K762bYKf1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705509988; c=relaxed/simple;
	bh=QuYROdC3cn0wquxPzQpVjZ5p7a1GBIucWN4OwSVJfTk=;
	h=DKIM-Signature:Received:X-MC-Unique:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Received:
	 X-Google-Smtp-Source:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding; b=P4ykUissge+6XsbhtFWi6UvG++aVzpwm8o1ma360U+frZ3zO8Sa3gnH+B93EiCssSieUhO7ir7516lKr6GKgy/Q928QYl6KNGGat9QCWzuH7krCISCruZhEazaDKtpn/tELhb93JohlmhKEfNhK/Wv+OzHTgPGvs91LhDjX/5vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=etD+PZoj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705509985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cd3Ose77j/HJBnKN6w+dtcgDO0iKk1wmfevfCIa9z2M=;
	b=etD+PZojtdf6V5vh8DKTJJt5jdfCeBt/NNDzbeReFhvdvjnQqtkEi6LgPC88WaHv0E64hj
	qY2QOk7TcTQRPZrqFrahz3Gx35RYX49H35jxAAaCaAA42ZtQUqYPEMIuGQLqPuZ0LYcrAU
	mhe39gWm8niZUJcinKoctkdyjEVmHHg=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-4Q18lO9sPTKyY5QiID1lhw-1; Wed, 17 Jan 2024 11:46:21 -0500
X-MC-Unique: 4Q18lO9sPTKyY5QiID1lhw-1
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-42987be5d14so149499331cf.1
        for <kvm@vger.kernel.org>; Wed, 17 Jan 2024 08:46:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705509981; x=1706114781;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cd3Ose77j/HJBnKN6w+dtcgDO0iKk1wmfevfCIa9z2M=;
        b=XYdBB6c4dqQhwh/reR6fBihl1mJFvfctJ9/9QU+ICALu9NvWHxNHbjN55GZnSDWBNs
         nsti550BGAEB4eF6u+/L9vBozs9pbWmlcTPkUARiwnGLrt121E3txzUujldQBAC8Xwlk
         2F2rvUy07HM1ugjKgMQuCMKFWy3/Mxry4/CzIK045fPw6tfapVq/zhet2VqNjb/4qLqo
         UdkiWMAXOKgtHl7p2lsvWX0ajYJ66WAUhPs3Ov/Gyczu+bvwlJx9J17fPyeS4oMgpNBq
         drIc+rAcFgGHi9jV9Enjn9P9ukPcGE6JpFHeDGh4geWuQo4dnMTggCXCMrCwnZqc1pYH
         4CKA==
X-Gm-Message-State: AOJu0YxDPF567SuHuMV6ITjKyCaqLnMddLq6O7ok09nZiLakdSNMtsPG
	UTvhbSpuG2fHPBMOiBlC2VUD2YYe1f1OqMR10lQ1gml9YNuVb4EURcoRkIpWSgUobY0RPr7+jo7
	BTcVD9usLVmUfh/pgdxUh
X-Received: by 2002:ac8:5a8f:0:b0:42a:1553:cff6 with SMTP id c15-20020ac85a8f000000b0042a1553cff6mr220654qtc.126.1705509981281;
        Wed, 17 Jan 2024 08:46:21 -0800 (PST)
X-Received: by 2002:ac8:5a8f:0:b0:42a:1553:cff6 with SMTP id c15-20020ac85a8f000000b0042a1553cff6mr220640qtc.126.1705509981068;
        Wed, 17 Jan 2024 08:46:21 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id bq9-20020a05622a1c0900b00429940c13a8sm5928765qtb.34.2024.01.17.08.46.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jan 2024 08:46:20 -0800 (PST)
Message-ID: <00336880-d380-4c64-a0dc-67d7ca6fedbd@redhat.com>
Date: Wed, 17 Jan 2024 17:46:16 +0100
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] arm/kvm: Enable support for KVM_ARM_VCPU_PMU_V3_FILTER
Content-Language: en-US
To: Sebastian Ott <sebott@redhat.com>
Cc: Shaoqin Huang <shahuang@redhat.com>, qemu-arm@nongnu.org,
 Gavin Shan <gshan@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
References: <20240115080144.44944-1-shahuang@redhat.com>
 <852ee2a3-b69f-4480-a6f4-f2b274f5e01c@redhat.com>
 <36a1efb3-2538-c339-d627-843e7d2b6541@redhat.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <36a1efb3-2538-c339-d627-843e7d2b6541@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 0ny1knpnEWyn

Hi Sebastian,

On 1/17/24 17:29, Sebastian Ott wrote:
> On Wed, 17 Jan 2024, Eric Auger wrote:
>> On 1/15/24 09:01, Shaoqin Huang wrote:
>>> +    /*
>>> +     * The filter only needs to be initialized through one vcpu
>>> ioctl and it
>>> +     * will affect all other vcpu in the vm.
>>> +     */
>>> +    if (pmu_filter_init) {
>> I think I commented on that on the v4. Maybe I missed your reply. You
>> sure you don't need to call it for each vcpu?
> 
> From (kernel) commit d7eec2360e3 ("KVM: arm64: Add PMU event filtering
> infrastructure"):
>   Note that although the ioctl is per-vcpu, the map of allowed events is
>   global to the VM (it can be setup from any vcpu until the vcpu PMU is
>   initialized).
Ah OK. I forgot that specificity.

Thanks!

Eric
> 
> Sebastian
> 


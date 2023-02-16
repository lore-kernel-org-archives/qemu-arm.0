Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp678404ejb;
        Thu, 16 Feb 2023 08:53:26 -0800 (PST)
X-Google-Smtp-Source: AK7set/76QTQozgUn0fGp2vriDBY8oI4xlOyFQ0kZTVouczRv1BKCHtninnw+PHGYIXE78LqFfzy
X-Received: by 2002:adf:f450:0:b0:2c5:5759:12d2 with SMTP id f16-20020adff450000000b002c5575912d2mr5583289wrp.35.1676566406522;
        Thu, 16 Feb 2023 08:53:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676566406; cv=none;
        d=google.com; s=arc-20160816;
        b=PosEtLj19XBo/jWfybX8V2vxjNiePs9x5oNlzjf0e42TfdmXrp3Sq8OPQ2sQ/Ce4QV
         lMohYA8G8zdZGolD1L9qzqksFX+/Xu1wka9ZWhqCB/+nBkSc310Di3GPS7ZKCB3PCQKb
         cyOMAolMgp0hoPD+y7GNHmvqedhVbUoyLvDR2IDt9qiPkLJeQWmO8+eal79Q+DMXJxPZ
         1p+p2zIXTxUYaswawOd7TvE022DzuehK0H3yMECpkkc9WgGFTjrDvpnf9xTxWPqnK8tz
         h8qPcLij2v5HI4EHfyhYSOnqW/J78dOddxBnfTtf4RpuTKlNWn9apE9ZsZFhRxgE7LkB
         rD+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=LgjhFD+W/qPsHQW/LYSNNLiSl3Ah26asiJ19nFAQOfM=;
        b=Uq1HGzXlgB54RSqdOzbQtuOHf4Ab9vOP88UbcpTQNegDSYQaAsq5t0UEUED2XeTktl
         9NBddra6E/iCFtVdvBPwfIGaTUbpft1+2XwjVGJtdl+pNxl/j43Eu6cwPlyKVlds0KhJ
         cuw5b+rDppx0kzZAEXmD4S1jkkZuA9I3cvzORERP4VVredAjtHWB78GHvUCihnh+uhqh
         Vq2GVEjMlufUT4YU/jMlixZGpkrwehutsXmz1HPfClEFgmDsjKOizbir4s8ZqnI+Cnw7
         VFLCfUhcV2vTen/fz1oNvKQIN4voRWIh0RcWPU3Snp+n7nUnHkebFVHXBERu/7DT/fWm
         7X/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fR0F7yyQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b1-20020a5d45c1000000b002c3e2531503si2266406wrs.959.2023.02.16.08.53.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Feb 2023 08:53:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fR0F7yyQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pShVD-0002Il-Tf; Thu, 16 Feb 2023 11:53:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pShV7-0002IH-3q
 for qemu-arm@nongnu.org; Thu, 16 Feb 2023 11:52:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pShV5-0005xx-MV
 for qemu-arm@nongnu.org; Thu, 16 Feb 2023 11:52:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676566370;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LgjhFD+W/qPsHQW/LYSNNLiSl3Ah26asiJ19nFAQOfM=;
 b=fR0F7yyQmIQHadDeuN5WEPBNn+NsBRfT/JB5lDu3w+ZBF1mo1EkhPSwa6NQ7F6ouyp35yF
 ixvmJgY4Wt/YYCk1jovT3kGh6mFfIry4OlXAoOPFc/leLYNuphZ/Bfi9tGv5TZkF+RDjeW
 NBchgtFpyTdSmgyHwe4UOBQwXKyjU8o=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-262-AEUhRrpDNwiWhpBRlrLFIw-1; Thu, 16 Feb 2023 11:52:48 -0500
X-MC-Unique: AEUhRrpDNwiWhpBRlrLFIw-1
Received: by mail-qt1-f200.google.com with SMTP id
 he22-20020a05622a601600b003ba3c280fabso1541183qtb.2
 for <qemu-arm@nongnu.org>; Thu, 16 Feb 2023 08:52:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LgjhFD+W/qPsHQW/LYSNNLiSl3Ah26asiJ19nFAQOfM=;
 b=SzwRRdoQLimm85z8W49D63T01WohnHHsw4lr0eMweORHMmlJNuo/oJJWYG1/qJ8H3M
 iL9vACauPy2TcGldPtjI/FQhWpzCp9MTKZYqiBYbp6yGs1GBwBpoA+HMuc5kCJDn4+Ls
 HjCDh/pg6QeMYqMpOR/aAleoyZPsviqYaPMXWFJbvKbmvbKsdvzanu9IN/DJqPDHBlui
 JGmpw8o3jDybIh+orOuGNcGqZYmIZDBvmIYouOqlOZcUMjykotie+7JYSqZ+4dFSZk3j
 CMLloj1C0klbqYs49B/mvLzHN+l5T26RUSZa0NwK489Jo+Ubk8s8bzPP8I2jhQWiKXLr
 +nYA==
X-Gm-Message-State: AO0yUKVQf/hpM9bvdZGNhIkE+BibznrAFr0MxqJxXx6xUmCI7v56YAmr
 Ws6eEp2BpOyQ9Yfe5dxBirM4+du5yzSL7gqsCxunCikG41UdtWNJ8TjIFoN7zeb4JJdnDPDrNHx
 GJCvPTTB80GiF
X-Received: by 2002:ac8:5bc7:0:b0:3b2:4309:99e with SMTP id
 b7-20020ac85bc7000000b003b24309099emr10667899qtb.54.1676566367771; 
 Thu, 16 Feb 2023 08:52:47 -0800 (PST)
X-Received: by 2002:ac8:5bc7:0:b0:3b2:4309:99e with SMTP id
 b7-20020ac85bc7000000b003b24309099emr10667879qtb.54.1676566367511; 
 Thu, 16 Feb 2023 08:52:47 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 i17-20020ac80051000000b003a6a19ee4f0sm1537882qtg.33.2023.02.16.08.52.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 08:52:46 -0800 (PST)
Message-ID: <e349bd12-23c9-87bd-f9ba-654c7885489c@redhat.com>
Date: Thu, 16 Feb 2023 17:52:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [RFC PATCH 10/16] hw/arm/smmuv3: Make TLB lookup work for stage-2
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20230205094411.793816-1-smostafa@google.com>
 <20230205094411.793816-11-smostafa@google.com>
 <00066890-06bc-3091-8484-bf39c29df77b@redhat.com>
 <Y+40glPkaM0aK5C/@google.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <Y+40glPkaM0aK5C/@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.351, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Q9Ey5R/FIuSb



On 2/16/23 14:49, Mostafa Saleh wrote:
> Hi Eric,
>
> On Thu, Feb 16, 2023 at 12:32:21PM +0100, Eric Auger wrote:
>>>      SMMUTransTableInfo *tt;
>>>      SMMUTransCfg *cfg = NULL;
>>> +    uint8_t granule_sz, tsz;
>>>      IOMMUTLBEntry entry = {
>>>          .target_as = &address_space_memory,
>>>          .iova = addr,
>>> @@ -764,21 +767,40 @@ static IOMMUTLBEntry smmuv3_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>>>          goto epilogue;
>>>      }
>>>  
>>> -    tt = select_tt(cfg, addr);
>> maybe we shall adapt select_tt for S2 instead of using temp? I know
>> there is a single range on S2 but well, use tt[0]?
> We can adapt select_tt for S2, but we would need to have an instance
> of SMMUTransTableInfo in SMMUS2Cfg instead of having vttb,tsz..
> inlined, as the function returns a pointer to the SMMUTransTableInfo.
> I don’t think we can reuse tt[0], as this would change when we support
> nesting, so I think we just isolate s1 and s2 from the beginning.

OK fair enough, let's wait for others' feedbakcs then.

Eric
>
>
>>> -    if (!tt) {
>>> -        if (cfg->record_faults) {
>>> -            event.type = SMMU_EVT_F_TRANSLATION;
>>> -            event.u.f_translation.addr = addr;
>>> -            event.u.f_translation.rnw = flag & 0x1;
>>> +    if (STAGE1_SUPPORTED(s->features)) {
>> maybe check the enable state instead.
> Yes, if stage-1 is not enabled, tt might not be valid, I will update it.
>
> Thanks,
> Mostafa
>


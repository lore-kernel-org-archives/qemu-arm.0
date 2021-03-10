Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp906557lfg;
        Wed, 10 Mar 2021 14:00:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwBA7VfWCapQNId5JWn0aDV6KIe7Ca2F44VCa3u8TJLrrG4OMF2VMYI8QHKRWteYvyrdfMA
X-Received: by 2002:a4a:e8d1:: with SMTP id h17mr2730411ooe.20.1615413637382;
        Wed, 10 Mar 2021 14:00:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615413637; cv=none;
        d=google.com; s=arc-20160816;
        b=ffOw5dlhrljaw9Q2Qi9nDQth9FrGnEjXUzjM4uViK/Wc2D183VsrhpgJc2lL8WErtl
         NXjIu5ri5Ax4MqUh7B9otnsU2RBkHr/lYBVE2NrWfP1Q7z+GsjGYu8i6mZOCaZRkNz6I
         EJ7hixdchspetpYy58wUibaNPjJnPfOCvxZPBXGX1QnrHBE4+jIf7ggRa1zgYakCGHk/
         9VioycuDMGJTKl8RmtMeepRIM7YsptYt+uytHUIOL0rkFTFI7hPupg4maAo5td2dtHaV
         KVVrUJ6MyupkWw91FqiaCYrSpBSPjsSfVQPriZWqf7sI9lFRPvcQ1qFh9Sq/NAM74NF3
         1IdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=GUn4kUvUN9HZ5OWofuz5zx/E+kceRjyBd/xxvqEusHU=;
        b=quHriigMd3yHf77jVu417RPlGDx+RgwEocHQxIu1i51ofr3cR8/z8CaXKQnoZcWWCe
         ZXpYRCJi+WIJ14rogQKBcFZDHJqZxgJApBjqYdXQuhosdU77yG23B3kKPMCAorIrLdPX
         1yHl+qp1CIDCC1V421mYE7fRE7gPpvFgRScIokssT+MK2zFT3A4QJcbAohAxLbURSUBX
         vpfETJ8HqqO3G7hAJOWMKeXiycWH0k9wLq1pIGlLF4UWGdyBoLvPF1zV9B5zAGuav5Za
         8LDb0bQDi0xuk9OSYpOXv1f6RUYA+Q9LIyc1MtJ90hlj+mO24jc4wvmIn43gAFhjXni4
         QQoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=sR6ETms0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p9si752029ota.140.2021.03.10.14.00.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Mar 2021 14:00:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=sR6ETms0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lK6se-0006vQ-GE
	for alex.bennee@linaro.org; Wed, 10 Mar 2021 17:00:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lK6ry-0006PB-P2
 for qemu-arm@nongnu.org; Wed, 10 Mar 2021 16:59:54 -0500
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36]:35505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lK6rv-0002lR-Vl
 for qemu-arm@nongnu.org; Wed, 10 Mar 2021 16:59:54 -0500
Received: by mail-qv1-xf36.google.com with SMTP id x27so1610540qvd.2
 for <qemu-arm@nongnu.org>; Wed, 10 Mar 2021 13:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GUn4kUvUN9HZ5OWofuz5zx/E+kceRjyBd/xxvqEusHU=;
 b=sR6ETms0H3ATh7FqCaPfU0OnxFjdkEDJXM+j+sXEbtPb7KuevXUHmRYheXV0pY23lZ
 4L5fKrf4es7iiDLL+kruPJQfxSZSptJUbimsRKr/I1gcgedS74WGj1ZxiE2Gg+0DSWd/
 IjjjNzkN4fMuNnsrujfidbOIKMJjjiocokctw1j4VaWeRgDPRMKfY9zyyqCOspHCMr4L
 icHsmFMrTHYJLMCfeOXg1sbSLZcMIYkaotRgJcPlXhuwZwQXbLweDQVVVa2Pg4EisLQt
 /3xsZkORfWM29++v/3RUzZExFTwCyVPeXP0JySW4YmMJIqF3vGAi9T9CAQm0qOZMTPwT
 5RYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GUn4kUvUN9HZ5OWofuz5zx/E+kceRjyBd/xxvqEusHU=;
 b=gjIdTXId10tJvKoEBur46x5NB8SMfNIpkgwpavRP9j2oEffOa50MtpCS7XDAf5cY5k
 Ac+NvOFJJ0Kq4LRmQiK5h+TxvDe+TW5xuMPu3xsF3zqGBtt5B+6ig9E+KujAU8ZHPi1R
 YvzI04VTm/RfxP6iUH6wzSOSOuBPQpz+0IpdOFTYwUGRCJSBjcDsWqyZ6LbTpn7NmUph
 GSKqIoS3mMPmrvLL/8qhhMtxHPbUJ7l2wNszcrO6aryaakdm+SpykIGegjecxNbyazg1
 EeSYBZpmlHImCitqw3LNoLMTX36pb01lKYQ4BQw1ie3sOn7VG8ZYK//N4LbG7Hdc+gyy
 IajA==
X-Gm-Message-State: AOAM533mtXTz2MpBMvNn6UXKsY0pD2hDeZ9a+zn6BWYImBBSjq6x9mBM
 dlmpFYt/WbesPmq08yM+YgMi0Q==
X-Received: by 2002:ad4:44a9:: with SMTP id n9mr5156585qvt.60.1615413590397;
 Wed, 10 Mar 2021 13:59:50 -0800 (PST)
Received: from [10.0.10.142] (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id x36sm474091qte.1.2021.03.10.13.59.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 13:59:50 -0800 (PST)
Subject: Re: [PATCH v3 1/3] target/arm: Add support for FEAT_TLBIRANGE
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20210310002917.8876-1-rebecca@nuviainc.com>
 <20210310002917.8876-2-rebecca@nuviainc.com>
 <3930c2d8-8972-0acf-7a48-71803072a559@linaro.org>
From: Rebecca Cran <rebecca@nuviainc.com>
Message-ID: <35b847ab-b064-248d-adf4-143ae8d7a19d@nuviainc.com>
Date: Wed, 10 Mar 2021 14:59:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <3930c2d8-8972-0acf-7a48-71803072a559@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=rebecca@nuviainc.com; helo=mail-qv1-xf36.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qbmQgz+rdVNf

On 3/10/21 12:24 PM, Richard Henderson wrote:
> On 3/9/21 6:29 PM, Rebecca Cran wrote:
>> +void tlb_flush_page_range_by_mmuidx(CPUState *cpu, target_ulong addr,
>> +                                    unsigned int num_pages, uint16_t 
>> idxmap)
> 
> I am not keen on this interface.  I think you should take either 
> start+end addresses (inclusive) or start+length (in bytes).
> 
> Using num_pages, and as an unsigned int, seems too easy to fail when 
> applied to a different guest.
> 
>> +{
>> +  /*
>> +   * We currently do a full flush, but for performance this should be
>> +   * updated to only flush the requested pages, taking TBI into account.
>> +   */
>> +    tlb_flush_by_mmuidx(cpu, idxmap);
>> +}
> 
> And if you're going to cop-out like this, you might as well just do it 
> in target/arm and not add these new interfaces at all.
> 
>> +#ifdef TARGET_AARCH64
>> +static unsigned int tlbi_aa64_range_get_num_pages(CPUARMState *env,
>> +                                                  uint64_t value,
>> +                                                  uint64_t addr)
>> +{
>> +    unsigned int page_size;
>> +    unsigned int page_shift;
>> +    unsigned int page_size_granule;
>> +    uint64_t num;
>> +    uint64_t scale;
>> +    uint64_t exponent;
>> +    uint64_t high_addr;
>> +
>> +    num = (value >> 39) & 0xF;
>> +    scale = (value >> 44) & 0x3;
>> +    page_size_granule = (value >> 46) & 0x3;
> 
> extract64()
> 
>> +
>> +    switch (page_size_granule) {
>> +    case 1:
>> +      page_size = 4096;
>> +      page_shift = 12;
>> +      break;
>> +    case 2:
>> +      page_size = 16384;
>> +      page_shift = 14;
>> +      break;
>> +    case 3:
>> +      page_size = 65536;
>> +      page_shift = 16;
>> +      break;
>> +    default:
>> +      qemu_log_mask(LOG_GUEST_ERROR, "Invalid page size granule %d\n",
>> +                    page_size_granule);
>> +
>> +      raise_exception(env, EXCP_UDEF, syn_uncategorized(),
>> +                      exception_target_el(env));
> 
> You can't raise an exception from here, because you don't have all of 
> the context for unwinding the tcg state.  Which you cannot access from 
> within the callback of an ARMCPRegInfo.
> 
> The manual says that if TG does not correspond to the granule size of 
> the actual translation then "the architecture does not require that the 
> instruction invalidates any entries".  "Reserved" can be safely assumed 
> to "not correspond", so I think you could just as easily return 0 here, 
> after logging the guest error.
> 
> 
>> +    high_addr = addr + (((num + 1) << exponent) * page_size);
>> +
>> +    return (high_addr - addr) >> page_shift;
> 
> I'll note that it would be much easier for you to return a byte value 
> for the length, and that you don't actually need to pass in addr at all.
> 
>> +    uint64_t addr = (value & 0xFFFFFFFFFUL) << TARGET_PAGE_BITS;
> 
> The manual does not explicitly say, but I'm certain that this should be 
> a signed address, when regime_has_2_ranges().  Otherwise it would be 
> impossible to flush a range of kernel addresses.
> 
> But all of this is moot if we're just going to flush all pages.  At 
> which point you might as well simply re-use tlbi_aa64_vmalle1_write et 
> al.  Place your TODO comment in front of tlbirange_reginfo[] instead of 
> buried n-levels further down.

Thanks for the comments. I'll continue working on the full/proper 
implementation (including changing the interface to remove num_pages) 
and send out a v4.

-- 
Rebecca Cran

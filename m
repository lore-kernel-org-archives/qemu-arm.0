Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp419lfo;
        Tue, 1 Mar 2022 08:34:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxDG+FIgx4VGye7/0XuLNfxtb+bnzXnVzexnVtnuXFJCc8KzqzjMBlvcnvwzoAVObl+2PrF
X-Received: by 2002:a81:91d4:0:b0:2d6:b671:e71c with SMTP id i203-20020a8191d4000000b002d6b671e71cmr25446451ywg.312.1646152495052;
        Tue, 01 Mar 2022 08:34:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646152495; cv=none;
        d=google.com; s=arc-20160816;
        b=CRqCl+13OxcxSAoYxcLBJc/r1psVxlvrrMC8ZsqjPgX/XNSo+NKC6oHKDhqVBTUtWs
         hGdHrf1SdaqJ7M5x/GCMJvlPxwE8tK0clSGQ1cHvPcUpyWnVHYYyuL43SxBHMa5WlRDy
         swq+11j4tig7Kg0n07Jtrc+oNXaz739c/S5DpHbfK1xnrEEKjdNyeWzTUzymN6c+fSNu
         1qnZCS3eAf2Lwy6xHVoX8ln4Jy+I/aFaplSCDqisZMWDOdFeA+lb3UyAz8eCAh0jGul+
         j+Kfr6WSsSEwbM196IUPOdvtCTOwj02kdmbyU/K4PQtvbBpdZQo0w5h7gc5QzGpV1954
         2qcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:to:subject:from:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=zMs6geIRZGUb21w3O6Ms1ZjgZzSB7UuC0q+zp+Woh2E=;
        b=VN/X1EvnZ04YaAO09an8llGAIlkqXv7V/HQeAcL+BcBz9mgcLMLyarCRQlfHT5uR1r
         +fCbAV8+ySQx97ov1F/6miCLWQCsDf1iOxeUcMhtdQrcVEBIZ6I6bG+Xk4TE32nw9u9u
         nUwEg6K200xbEkUaiWqQny0qvKMGlS3rxaJcMYIAjm6HkH3cbb4ei9oX4qt92yPgR0DI
         H8p1THVci1YC1X6RQ3LQaaF2B+quanVqlpKgnYbACNRgZdDPSjkyBgifGlYqmRTugcu+
         C1AEHJdr49Tc0fpkiSev7nyaDerIfrORCLc4sk0w8QoEmiOKi97t61Vukh/MZGVNdFjf
         jNYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=oksVQSMR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e192-20020a25d3c9000000b0062873b3b89esi2825776ybf.603.2022.03.01.08.34.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Mar 2022 08:34:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=oksVQSMR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nP5Sc-0004dW-SQ
	for alex.bennee@linaro.org; Tue, 01 Mar 2022 11:34:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ubzeme@gmail.com>)
 id 1nP5SA-0004dK-JX; Tue, 01 Mar 2022 11:34:22 -0500
Received: from [2607:f8b0:4864:20::52e] (port=33458
 helo=mail-pg1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ubzeme@gmail.com>)
 id 1nP5S5-0004Sk-5Z; Tue, 01 Mar 2022 11:34:20 -0500
Received: by mail-pg1-x52e.google.com with SMTP id 12so14822539pgd.0;
 Tue, 01 Mar 2022 08:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:from:subject:to:cc
 :references:content-language:in-reply-to:content-transfer-encoding;
 bh=zMs6geIRZGUb21w3O6Ms1ZjgZzSB7UuC0q+zp+Woh2E=;
 b=oksVQSMRhuFOTUwhQuWKaHCCZlwBDXjljSc7bxSnHT7t8T1NE+BLoW24ELYGzpiUda
 dvE4+Hmdq3UaM+WzIbQJJrrTxpRRO7Raar2c0W8yD9JXagt4KPCKJaLDLnbzQKEuiX3b
 1BsGtp4vVeUQl6Su04yf6Sv841yBpX9DQ0BjEWWtjvpByL9m+HPPpNA3p0yylxx0zK2f
 jv5cMOM9wLItmbF7359CY8OnP2qhZfdFR+ZBi5oYVCW+Mc+VFWSv/E2QHhJn0oL0CGa4
 H38drHFVkmmj5mb5w8AXm2HKOtWjGk/6FNM4aeCkJmNaobC/V9/UZczGlqOEUTu98dFf
 14Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:from
 :subject:to:cc:references:content-language:in-reply-to
 :content-transfer-encoding;
 bh=zMs6geIRZGUb21w3O6Ms1ZjgZzSB7UuC0q+zp+Woh2E=;
 b=7KwOHVMODb8fWnEGwe2ddNkNGsy3npXghl8vbkGEvGhEYsywCXdn1NnHjjccsPZZMZ
 OWTMOkENVr82qtD2wgsp/pEpwpuBmYaA9FTTFocsICgvoA5aoV25bL8loULbLn22888w
 Prx1gHPSEGY0d26xj1OoVjzQDC69QMaOX5EStrgaXN3EKpoiU58I5lETUgSQQcDmomgv
 O/ycrnOxreOoRxTaBNbGLBdKyG5reKLQACIXgXuLGUjwovNj1hyYBqmMoa3BBtuinvww
 HkG+L/Bfv24my+SbtFs1DC8oapZGZ6XzupNVwiJpp8uczyeU1Ao1ZH2aqFkarXDHHF5u
 nL7w==
X-Gm-Message-State: AOAM533Tf2FSleuan8w0hx5rmTLwqxrxRlkE2xhW8kfwDfHHsQKbgxJz
 RwymlMBzQsfWZ92kGb1ZY9Q=
X-Received: by 2002:a62:7990:0:b0:4e0:5ae8:6c11 with SMTP id
 u138-20020a627990000000b004e05ae86c11mr28623358pfc.34.1646152452829; 
 Tue, 01 Mar 2022 08:34:12 -0800 (PST)
Received: from ?IPV6:2001:b011:e000:59d7:401f:1cea:ecc0:9594?
 (2001-b011-e000-59d7-401f-1cea-ecc0-9594.dynamic-ip6.hinet.net.
 [2001:b011:e000:59d7:401f:1cea:ecc0:9594])
 by smtp.gmail.com with ESMTPSA id
 e30-20020a056a0000de00b004ef299a4f89sm18172590pfj.180.2022.03.01.08.34.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Mar 2022 08:34:12 -0800 (PST)
Message-ID: <2da2f0bc-6c54-0a26-aafb-1f866cf93de8@gmail.com>
Date: Wed, 2 Mar 2022 00:34:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
From: Yan-Jie Wang <ubzeme@gmail.com>
Subject: Re: [PATCH qemu 0/7] Many improvements to HVF memory-related codes
To: Peter Maydell <peter.maydell@linaro.org>
References: <164603074537.20094.1732342403585879912-0@git.sr.ht>
 <CAFEAcA8hWy3rfGtYkyQjJSGgsX448_t01xmM4cwyCO0op4h1xw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAFEAcA8hWy3rfGtYkyQjJSGgsX448_t01xmM4cwyCO0op4h1xw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=ubzeme@gmail.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HUetE+Jm1ZL3

For the dirty-tracking part in my patch series, the major difference 
between this patch and Alex's patch is that the dirty-tracking logic in 
my patch will only mark the page being written dirty instead of marking 
the whole memory slot dirty, and will only restore the write permission 
to the page being written instead of the whole memory slot.

When memory regions overlap, "region_add" in memory listeners may be 
called with structure MemoryRegionSection containing non-zero 
offset_within_region.  This makes the start address of memory slots 
(member "start" in struct hvf_slot) not the same as the start address of 
the memory region. However, the dirty-tracking logics in both 
target/i386/hvf and Alex's patch assume that they are the same.

Currently, there is a bug in the dirty-tracking logic in 
target/i386/hvf. I modified codes in target/i386/hvf to fix the problem.

On the x86 platform, Ubuntu ISO boot menu did not show properly.

The link of the bug is https://bugs.launchpad.net/qemu/+bug/1827005

The modified codes use the new function, "hvf_access_memory",
introduced in this patch series to handle dirty-tracking.

Following is the dirty-tracking logic in original codes in
target/i386/hvf.

     if (write && slot) {
         if (slot->flags & HVF_SLOT_LOG) {
             memory_region_set_dirty(slot->region, gpa - slot->start, 1);
             hv_vm_protect((hv_gpaddr_t)slot->start, (size_t)slot->size,
                           HV_MEMORY_READ | HV_MEMORY_WRITE);
         }
     }

The problem of the above code is:

'memory_region_set_dirty' sets only the page that is being written 
dirty, but hv_vm_protect makes the whole memory slot writable.

Any write to the memory slot excluding the previous written page
and before the next call to "log_sync" in memory listener
will not be correctly tracked.


On Mon, Feb 28, 2022 at 10:11 PM Peter Maydell 
<peter.maydell@linaro.org> wrote:
>
> On Mon, 28 Feb 2022 at 14:07, ~ubzeme <ubzeme@git.sr.ht> wrote:
> >
> > I recently bought a Mac with M1 Pro chip, and use QEMU to setup a Linux
> > virtual machine.  QEMU crashed when I started a VM with HVF accelerator
> > enabled and with the device, bochs-display, added.
> >
> > After digging into the source code, I found that dirty-tracking in HVF
> > did not work properly, which made QEMU crashed. Therefore I made this
> > series of patches to fix the problem.
>
> How does this series compare with Alex's patch to enable
> hvf dirty tracking for target/arm/hvf ?
> https://patchew.org/QEMU/20220203142320.33022-1-agraf@csgraf.de/
>
> thanks
> -- PMM

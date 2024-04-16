Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp537691ejd;
        Tue, 16 Apr 2024 10:57:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU7ijrniU74lHcpGFdeg/TQgnxdHkxqe6u0xg6vr2arnjCVP616svGoJXIVvxy/zi662vLqxuObTdCKLQZ7QJbxCQo+2dXk
X-Google-Smtp-Source: AGHT+IGCQusETEJyvEUHMnYV9j86+Na5qdr3dQYTabbR68/b/HEivuzhtlc4JdNKIUsApBBlw03u
X-Received: by 2002:a05:6214:11aa:b0:699:23f8:1044 with SMTP id u10-20020a05621411aa00b0069923f81044mr13540580qvv.11.1713290225611;
        Tue, 16 Apr 2024 10:57:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713290225; cv=none;
        d=google.com; s=arc-20160816;
        b=QOWeaV+9TvPADltVCSQCq76bqGGe8HaBs4GEUjk2dUp1j8NMGuyIJCzwQuGsf95qx3
         2L9ELsrAaHTwxmbQGbp7qfRmttDsrrN1VLCkYwCsdJL7xAvzHnjdh3/dkOVdwp2fW1eH
         Gn5ybVwqA3gimQgBLXwQDxPAjQT7rXDZZ5E51NjvDSFGmoBY9TWp1s099bMaKevmLBmv
         ORPtQbSc/zVwIafaMGkAE0CbY1RLfG+HwwP75qa20Q50GmBeqXq9JuaVrpEBne6Yhfa9
         zHSf8d9dZ0cG6Ldb3O8i8GTiOtYnPS7slIJTPbvT6DgzHC5fMRDKVkwDMmodP8/z/9NV
         3lHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=Wy+7zjg9PrsYzdcOjL1rWVSlvzlQdFyFnj66RxrQnA0=;
        fh=DvV6x+jRDkANypMJm/Ktn2vEa2/TjfsXymxVIF5xab0=;
        b=DJhURjnQ72Ch6/nE7voJdEzd146fwHeiZ+kUaDcZYU0JeuEfI9ttuDvv4OKASCs2G4
         FeeWeLWtG0J65xTnZhhHZHYTcgGv7b5YgfEljchMlqm6Z8dSU8L0v5Upa0paDUS5R6bE
         xOQAbILZc2tq1aSt9oEKSvgDogJIO4F8NzXabLpOCC+r1rXpmJGgy7zFSH44aXoPGfKR
         39YJqr7Tic7tH31Q/xY4NqcKZSErAK75s4MdqIiRKE18kGJ7WisDNNTwPJfdK9XbQxLT
         JgiwW91TUgzM3dhTNDUghcPlaRnlNTU4u1vW9fO3E1wBg5lEL7A0j98IyRY6PTL04SeF
         LQtQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w18-20020a0cc252000000b0069b4ccd6a03si12098069qvh.204.2024.04.16.10.57.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Apr 2024 10:57:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rwn2s-0005Ee-5e; Tue, 16 Apr 2024 13:56:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adiupina@astralinux.ru>)
 id 1rwn2r-0005DV-Av; Tue, 16 Apr 2024 13:56:37 -0400
Received: from new-mail.astralinux.ru ([51.250.53.244])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adiupina@astralinux.ru>)
 id 1rwn2o-0002uI-Kf; Tue, 16 Apr 2024 13:56:37 -0400
Received: from [10.177.234.15] (unknown [10.177.234.15])
 by new-mail.astralinux.ru (Postfix) with ESMTPA id 4VJsD34k7hzlVtD;
 Tue, 16 Apr 2024 20:56:19 +0300 (MSK)
Message-ID: <69dffcb3-6424-420d-97b5-7aa72522ee98@astralinux.ru>
Date: Tue, 16 Apr 2024 20:56:19 +0300
MIME-Version: 1.0
User-Agent: RuPost Desktop
Subject: Re: [PATCH RFC] prevent overflow in
 xlnx_dpdma_desc_get_source_address()
Content-Language: ru
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Alistair Francis <alistair@alistair23.me>,
 Alistair Francis <alistair.francis@xilinx.com>, edgar.iglesias@gmail.com,
 edgar.iglesias@xilinx.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 KONRAD Frederic <fred.konrad@greensocs.com>, Hyun Kwon
 <hyun.kwon@xilinx.com>, crosthwaitepeter@gmail.com, hyunk@xilinx.com,
 guillaume.delbergue@greensocs.com, mark.burton@greensocs.com,
 sdl.qemu@linuxtesting.org
References: <20240412081328.11183-1-adiupina@astralinux.ru>
 <CAFEAcA9wfzpc74iA_2G-YbtQtwGCA9VPQuXagg-Q0FwC92tg+w@mail.gmail.com>
From: Alexandra Diupina <adiupina@astralinux.ru>
In-Reply-To: <CAFEAcA9wfzpc74iA_2G-YbtQtwGCA9VPQuXagg-Q0FwC92tg+w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DrWeb-SpamScore: -100
X-DrWeb-SpamState: legit
X-DrWeb-SpamDetail: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehuddgtddvucetufdoteggodetrfcurfhrohhfihhlvgemucfftfghgfeunecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttderjeenucfhrhhomheptehlvgigrghnughrrgcuffhiuhhpihhnrgcuoegrughiuhhpihhnrgesrghsthhrrghlihhnuhigrdhruheqnecuggftrfgrthhtvghrnhepvddtfeekhfegtdehfeektdeivdejgfduudfhffdulefhtddtjeehleevvddvieeknecuffhomhgrihhnpegrmhgurdgtohhmpdhlihhnuhigthgvshhtihhnghdrohhrghenucfkphepuddtrddujeejrddvfeegrdduheenucfrrghrrghmpehhvghloheplgdutddrudejjedrvdefgedrudehngdpihhnvghtpedutddrudejjedrvdefgedrudehmeegjeejkedvpdhmrghilhhfrhhomheprgguihhuphhinhgrsegrshhtrhgrlhhinhhugidrrhhupdhnsggprhgtphhtthhopedugedprhgtphhtthhopehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdprhgtphhtthhopegrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvgdprhgtphhtthhopegrlhhishhtrghirhdrfhhrrghntghishesgihilhhinhigrdgtohhmpdhrtghpthhtohepvggughgrrhdrihhglhgvshhirghssehgmhgrihhlrdgtohhmpdhrtghpthhtohepvg
 gughgrrhdrihhglhgvshhirghsseigihhlihhngidrtghomhdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdprhgtphhtthhopehfrhgvugdrkhhonhhrrggusehgrhgvvghnshhotghsrdgtohhmpdhrtghpthhtohephhihuhhnrdhkfihonhesgihilhhinhigrdgtohhmpdhrtghpthhtoheptghrohhsthhhfigrihhtvghpvghtvghrsehgmhgrihhlrdgtohhmpdhrtghpthhtohephhihuhhnkhesgihilhhinhigrdgtohhmpdhrtghpthhtohepghhuihhllhgruhhmvgdruggvlhgsvghrghhuvgesghhrvggvnhhsohgtshdrtghomhdprhgtphhtthhopehmrghrkhdrsghurhhtohhnsehgrhgvvghnshhotghsrdgtohhmpdhrtghpthhtohepshgulhdrqhgvmhhusehlihhnuhigthgvshhtihhnghdrohhrgh
X-DrWeb-SpamVersion: Vade Retro 01.423.251#02 AS+AV+AP Profile: DRWEB;
 Bailout: 300
X-AntiVirus: Checked by Dr.Web [MailD: 11.1.19.2307031128,
 SE: 11.1.12.2210241838, Core engine: 7.00.62.01180, Virus records: 12602275,
 Updated: 2024-Apr-16 15:52:41 UTC]
Received-SPF: pass client-ip=51.250.53.244;
 envelope-from=adiupina@astralinux.ru; helo=new-mail.astralinux.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5IKUp/Gd2m1Q

Peter, thank you! I agree with you that
as mentioned in the documentation
https://docs.amd.com/r/en-US/ug1085-zynq-ultrascale-trm/ADDR_EXT-Field,
we should take 32 bits of the address from one field
(for example, case 1, SRC_ADDR2_EXT - in code it is desc->source_address2)
and 16 bits (high or low) of the address from another field
(ADDR_EXT_23 - in code it is desc->address_extension_23, we need [15:0] 
bits)
and combine them to make a 48 bit address.

Therefore, I suggest making the following changes to the code
so that it matches the documentation:

static uint64_t xlnx_dpdma_desc_get_source_address(DPDMADescriptor *desc,
                                                      uint8_t frag)
{
     uint64_t addr = 0;
     assert(frag < 5);

     switch (frag) {
     case 0:
         addr = (uint64_t)desc->source_address
             + (extract64(desc->address_extension, 16, 16) << 32);
         break;
     case 1:
         addr = (uint64_t)desc->source_address2
             + (extract64(desc->address_extension_23, 0, 16) << 32);
         break;
     case 2:
         addr = (uint64_t)desc->source_address3
             + (extract64(desc->address_extension_23, 16, 16) << 32);
         break;
     case 3:
         addr = (uint64_t)desc->source_address4
             + (extract64(desc->address_extension_45, 0, 16) << 32);
         break;
     case 4:
         addr = (uint64_t)desc->source_address5
             + (extract64(desc->address_extension_45, 16, 16) << 32);
         break;
     default:
         addr = 0;
         break;
     }

     return addr;
}


This change adds a type cast and also uses extract64() instead of 
extract32()
to avoid integer overflow on addition (there was a typo in the previous 
letter).
Also in extract64() extracts a bit field with a length of 16 bits 
instead of 12,
the shift is changed to 32 so that the extracted field fits into bits 
[47:32] of the final address.

if this calculation is correct, I'm ready to create a second version of 
the patch.




12/04/24 13:06, Peter Maydell пишет:
> On Fri, 12 Apr 2024 at 09:13, Alexandra Diupina <adiupina@astralinux.ru> wrote:
>> Overflow can occur in a situation where desc->source_address
>> has a maximum value (pow(2, 32) - 1), so add a cast to a
>> larger type before the assignment.
>>
>> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>>
>> Fixes: d3c6369a96 ("introduce xlnx-dpdma")
>> Signed-off-by: Alexandra Diupina <adiupina@astralinux.ru>
>> ---
>>   hw/dma/xlnx_dpdma.c | 20 ++++++++++----------
>>   1 file changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git a/hw/dma/xlnx_dpdma.c b/hw/dma/xlnx_dpdma.c
>> index 1f5cd64ed1..224259225c 100644
>> --- a/hw/dma/xlnx_dpdma.c
>> +++ b/hw/dma/xlnx_dpdma.c
>> @@ -175,24 +175,24 @@ static uint64_t xlnx_dpdma_desc_get_source_address(DPDMADescriptor *desc,
>>
>>       switch (frag) {
>>       case 0:
>> -        addr = desc->source_address
>> -            + (extract32(desc->address_extension, 16, 12) << 20);
>> +        addr = (uint64_t)(desc->source_address
>> +            + (extract32(desc->address_extension, 16, 12) << 20));
> Unless I'm confused, this cast doesn't help, because we
> will have already done a 32-bit addition of desc->source_address
> and the value from the address_extension part, so it doesn't
> change the result.
>
> If we want to do the addition at 64 bits then using extract64()
> would be the simplest way to arrange for that.
>
> However, I can't figure out what this code is trying to do and
> make that line up with the data sheet; maybe this isn't the
> right datasheet for this device?
>
> https://docs.amd.com/r/en-US/ug1085-zynq-ultrascale-trm/ADDR_EXT-Field
>
> The datasheet suggests that we should take 32 bits of the address
> from one field (here desc->source_address) and 16 bits of the
> address from another (here desc->address_extension's high bits)
> and combine them to make a 48 bit address. But this code is only
> looking at 12 bits of the high 16 in address_extension, and it
> doesn't shift them right enough to put them into bits [47:32]
> of the final address.
>
> Xilinx folks: what hardware is this modelling, and is it
> really the right behaviour?
>
> Also, this device looks like it has a host-endianness bug: the
> DPDMADescriptor struct is read directly from guest memory in
> dma_memory_read(), but the device never does anything to swap
> the fields from guest memory order to host memory order. So
> this is likely broken on big-endian hosts.
>
> thanks
> -- PMM



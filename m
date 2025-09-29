Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 232FECAC5B0
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Sep 2025 06:24:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v37JM-0006EW-1u; Mon, 29 Sep 2025 02:24:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1v37JJ-0006BF-D0
 for qemu-arm@nongnu.org; Mon, 29 Sep 2025 02:24:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1v37J8-0002wn-26
 for qemu-arm@nongnu.org; Mon, 29 Sep 2025 02:24:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759127049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=X2EWl/rUt+7l0fd6siOmv82WVxsRMpFjG+44x0/rp8Q=;
 b=N3dvF5/kRlJaus3jVLVeUOUYOYzFgzbO524fSu0isnNWAYtEPQKbpCV4zNEbCE7GFLAu9c
 v/07AlRg7F8V/1tZqGwTUCjC0wioAqXQRsUFFi7HeQVQRNnX0ogVYMlG/uKVdaLPHKlJ7u
 sgLkeTHxAwz6XhsOrsoVuKhC3coRgWo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-xs3rsgCRMrOCDRdPXhY4tA-1; Mon, 29 Sep 2025 02:24:06 -0400
X-MC-Unique: xs3rsgCRMrOCDRdPXhY4tA-1
X-Mimecast-MFC-AGG-ID: xs3rsgCRMrOCDRdPXhY4tA_1759127045
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-b3f2cfc26edso44912066b.2
 for <qemu-arm@nongnu.org>; Sun, 28 Sep 2025 23:24:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759127045; x=1759731845;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X2EWl/rUt+7l0fd6siOmv82WVxsRMpFjG+44x0/rp8Q=;
 b=erLs7bVM5iFEhkl7W6KD3YCWN3tvtv3fMegxBtqjmM0HTiTSUOqgiOp9pPzEs5FGXX
 NDUt3HdyYtnsdFhAgiIL1Kfz2t+8kQAng7UTMC4FPTC8Zgrg5DHNt3FkOHnVOQj2jwoV
 ef65QgkfzkKhYlXwbgoT/mF+wI+LiPbgpE4Oz5rJ1/UaGcKtGqiLNmGgPBAPQ/ncVc+9
 0SnU6VssyZnwbTtW9B/oSE33a3k3UPaUgstQ1QSTA7zG5b4udNE/UY7bsUOn4+nl3a0d
 NvKTnu92hEqAhD5rOZmHvjmhy+9pNgw72v7kkIFIHdjPqIcWPHq5YO6PBV0m0WsFLxab
 xItw==
X-Gm-Message-State: AOJu0Ywje0Kjj40BJnU+EhiFl9VrKLkWBi4XKbeMhO1pCKzgO+xRJJy/
 kj6yabFZcjiHmYce670kwPpxt0uGcktwYpST7WNAlsGdowTedMpR39nEF1XWnwGMd8Wzirb1yDb
 WO4UVuFQ1YS+hGTdqiFYlIpXSEI9HnoNCuVdcczZtnK4OGDDD3uIyMw==
X-Gm-Gg: ASbGncsIQXjAXIEj/7m7B3qNqshIiNjrma9/1toNUA1J8F7WiLiiiheVlNXrIShGzsp
 nLWVZnyGGF/T33NMHhmjRQP6I9+MzCPSxs1TLZtI+2H59Wk+bqfyRHHpOxlcxV23uGmoG7jek/T
 57db0j8rNbhULikL0rE72XUds09toA9ZVw8VZ3tfyJR5dVx3ZDyeRxsxJvZfwJzekrYqI1kTfEO
 U96qIkmELSSxftcEUhjVBLfqPJaOEAdogd9SNLgZXmHW0EnMF33xnOLuUoubZmdrRfVeTdQKCxX
 vq5T0rWYqeQxhrQ1xaczK80VjaIunpgYREAZH2sRgdO1rcBnfBahhjFH0iyU9Jv16B/VKhpggb7
 8pnV95A==
X-Received: by 2002:a17:907:6d0f:b0:b0d:9d6a:fe14 with SMTP id
 a640c23a62f3a-b34b7ccdd35mr1845225366b.26.1759127044899; 
 Sun, 28 Sep 2025 23:24:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIl2WzPG/X4/WxY9tG4230Lb6nLbR7ehWriLrDjh1/FxBDPPHUVvyioQcpKlNe4stHCzrGdA==
X-Received: by 2002:a17:907:6d0f:b0:b0d:9d6a:fe14 with SMTP id
 a640c23a62f3a-b34b7ccdd35mr1845223866b.26.1759127044502; 
 Sun, 28 Sep 2025 23:24:04 -0700 (PDT)
Received: from [192.168.0.7] (ltea-047-064-114-212.pools.arcor-ip.net.
 [47.64.114.212]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b3544fd0a9esm879426966b.84.2025.09.28.23.24.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Sep 2025 23:24:03 -0700 (PDT)
Message-ID: <b57e8c52-1241-4d34-b2c9-d5a67e762a2a@redhat.com>
Date: Mon, 29 Sep 2025 08:24:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/9] tests/functional: Adapt reverse_debugging to run
 w/o Avocado
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 alex.bennee@linaro.org, berrange@redhat.com
Cc: qemu-arm@nongnu.org, manos.pitsidianakis@linaro.org,
 peter.maydell@linaro.org
References: <20250926051542.104432-1-gustavo.romero@linaro.org>
 <20250926051542.104432-9-gustavo.romero@linaro.org>
 <ec28971b-fe8c-4a6a-b241-10ff1468c991@redhat.com>
 <4266bc6b-44ad-4318-99ac-71d94d02fae9@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <4266bc6b-44ad-4318-99ac-71d94d02fae9@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dm9CxhLCGMiSZUF9vJ6CU-DSjwWxKXa0Eg7EjfWfDCk_1759127045
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 26/09/2025 18.00, Gustavo Romero wrote:
> Hi Thomas,
> 
> On 9/26/25 05:44, Thomas Huth wrote:
>> On 26/09/2025 07.15, Gustavo Romero wrote:
>>> This commit removes Avocado as a dependency for running the
>>> reverse_debugging test.
>>>
>>> The main benefit, beyond eliminating an extra dependency, is that there
>>> is no longer any need to handle GDB packets manually. This removes the
>>> need for ad-hoc functions dealing with endianness and arch-specific
>>> register numbers, making the test easier to read. The timeout variable
>>> is also removed, since Meson now manages timeouts automatically.
>>>
>>> reverse_debugging now uses the pygdbmi module to interact with GDB, if
>>> it's available in the test environment, otherwise the test is skipped.
>>> GDB is detect via the QEMU_TEST_GDB env. variable.
>>>
>>> This commit also significantly improves the output for the test and
>>> now prints all the GDB commands used in sequence. It also adds
>>> some clarifications to existing comments, for example, clarifying that
>>> once the replay-break is reached, a SIGINT is captured in GDB.
>>>
>>> reverse_debugging is kept "skipped" for aarch64, ppc64, and x86_64, so
>>> won't run unless QEMU_TEST_FLAKY_TESTS=1 is set in the test environment,
>>> before running 'make check-functional' or 'meson test [...]'.
>>>
>>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
>>> ---
>> ...
>>> @@ -53,49 +55,11 @@ def run_vm(self, record, shift, args, replay_path, 
>>> image_path, port):
>>>           vm.launch()
>>>           return vm
>>> -    @staticmethod
>>> -    def get_reg_le(g, reg):
>>> -        res = g.cmd(b'p%x' % reg)
>>> -        num = 0
>>> -        for i in range(len(res))[-2::-2]:
>>> -            num = 0x100 * num + int(res[i:i + 2], 16)
>>> -        return num
>>> -
>>> -    @staticmethod
>>> -    def get_reg_be(g, reg):
>>> -        res = g.cmd(b'p%x' % reg)
>>> -        return int(res, 16)
>>> -
>>> -    def get_reg(self, g, reg):
>>> -        # value may be encoded in BE or LE order
>>> -        if self.endian_is_le:
>>> -            return self.get_reg_le(g, reg)
>>> -        else:
>>> -            return self.get_reg_be(g, reg)
>>> -
>>> -    def get_pc(self, g):
>>> -        return self.get_reg(g, self.REG_PC)
>>> -
>>> -    def check_pc(self, g, addr):
>>> -        pc = self.get_pc(g)
>>> -        if pc != addr:
>>> -            self.fail('Invalid PC (read %x instead of %x)' % (pc, addr))
>>
>> I think it would make sense to keep wrapper functions get_pc() and 
>> check_pc(), since that functionality is still used in a bunch of places 
>> (e.g. "gdb.cli("print $pc").get_addr()" is used a couple of times).
> 
> Yeah, I considered that, but I really think that using the
> wrapper functions doesn't add to this test (as in the original test).
> First because I like reading the test code and easily map it to
> its output and, second, the original test that used check_pc() was
> actually failing with this "Invalid PC ... " message in all the cases,
> which is not informative. In my version, because I check PC in place,
> I also fail with a specific message for each case, like "Forward stepping 
> failed¨,
> "Reverse stepping failed", "reverse-continue", etc.
> 
> If you don't mind I'd like to keep the test this way.

Ok, fair point. But you could at least consider keep the wrapper for 
get_pc(), I think.

>>> +    @skipIfMissingEnv("QEMU_TEST_GDB")
>>
>> Somehow this SKIP is always triggered on my system, even if I correctly 
>> pointed "configure" to the right GDB with the "--gdb" option ... not sure 
>> why this happens, but I'll try to find out...

It was the additional logic in patch 3 (see my other mail) that caused the 
gdb detection to fail and thus the environment variable was not set.

  Thomas



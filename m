Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3848465lfg;
        Mon, 22 Mar 2021 11:47:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRGalsqJClzZ1cLZm3jmdUFqOy8fm1AwnCc1DEeZrECfsRI2qDJ9PPpUhBpHK9ldfFYMh3
X-Received: by 2002:a6b:b447:: with SMTP id d68mr933772iof.87.1616438873771;
        Mon, 22 Mar 2021 11:47:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616438873; cv=none;
        d=google.com; s=arc-20160816;
        b=B6GmEzpGeoFFUBv+v8NsymO6unENTQkdSoQajTiZJ74WmFPuuoMAPHeKtMtkkwz1jI
         qEde0oJVfTThbzcx69CeYW/gXQAupfDJPNyTqq531PFbPWuwNsCDAJyNZ5cMkClv9fv/
         lba78vy+du892eCyGwyU8S7hwrDZZAayzgV6kfANjGBj2w78+tvBX9L2oPfM3lzps+i5
         XwUMgdNY9dD5dywlGp+VXSGDD+xN+0+ISLo9gQxoCWiCbj7UXvrtjXldkGmDirtmxLHL
         BTbQKgvQ+JffbHSqBRcnECb8VgaDcX0Zz7oM6wTKXeYHfxpRUz+BJJ8j0qc6L4Z5NoWe
         yF3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=h7iw4VscpC17AW79LRMX3Syh5NrUe85Vvhx9bTf03F8=;
        b=DQuod6M2pTDLCel3Xqxp3T+L3hEPZ5AYsMyTB2wkIoouN8TsVHUxbXuf8R4WEpf3wU
         jORlMt2geFExU13HCl2RtCI5ROER2BcAWhP+whQlEFk2WPu8PNOQpdzIAjVTchFf+j26
         QAC6bqgFJuox4CeNYs5N0b9ZoPaffyA6mtVm6hfNrPV8z2eLZH0Ww7fLMw/pR3Yl+xA3
         ZiAm0vtLf1IbPI60QNyzxKb1jiLVF5aL/+c9GYb2YGysUrscdhAPgTtd3kn2leo/wqMf
         BaGEbgLwhNASNku5gY+JrTdKt2XnuCLc8tXFfa7ROmBAz7s+TbXcNBQZXl3GzGc0KmB4
         465w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=E06JBvxD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d2si9533300iod.10.2021.03.22.11.47.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Mar 2021 11:47:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=E06JBvxD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:33450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lOPai-0005Oq-RJ
	for alex.bennee@linaro.org; Mon, 22 Mar 2021 14:47:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOPZy-0005Mp-07; Mon, 22 Mar 2021 14:47:06 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:50795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOPZw-00081I-3P; Mon, 22 Mar 2021 14:47:05 -0400
Received: by mail-wm1-x334.google.com with SMTP id g25so9791325wmh.0;
 Mon, 22 Mar 2021 11:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=h7iw4VscpC17AW79LRMX3Syh5NrUe85Vvhx9bTf03F8=;
 b=E06JBvxDXzQUHAkhheHi/RGk9capqf73lTk0PSBvp97Il81vPu81Oh2LQlvMWCMgIi
 bBeOOduysu80dIcofrQp1ujHc/R/+OeFtO2/PWLVBwUbinLa8/CADg5Ls4ISVQi5ska2
 T+zStV1rSGngT04DmX+WJpNtgTQiquHS5C86Kt/D2RhmSP+WfwV83VRuyqx7PSZ09jrH
 fCdK64+BCIK7Hk5VT7WRI/CS6RU+B3GASyxbZIEwVkcsD5zyGZcTSUBr2d7CdsWd9vGu
 7EyNFKiwzPibXbjedaK0i75XImXqDSF2gNybgzFeEvuKcVRhJN9GSPbD+hS786nTbM+c
 YF8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h7iw4VscpC17AW79LRMX3Syh5NrUe85Vvhx9bTf03F8=;
 b=ABjzsWxJ3i4nsWuMtYEnYofaEFSe0U5X83E/e/3QWHIVyqCzku62IP0MVzKE+zW3/F
 OOptKbMwXkvhu5RXBCGBe16m5zfc22gqZOzfr0FSnEiSzuGM2ITItoAgvyPob98iqD4Y
 YcNrZJXrz6oIRvJiChlsetioo5ipwc6C6PQ3bV3yWQYMcSiSJpVCGLqjqUUrPa1GEXh5
 CVTHXjZESzx/EEFeGbd6044DQrgx5R91hsU6v46wEmMagCCVZExbcYHavpUszBKELona
 Ul5wW6T4T+rnqHg3KHE8rkSbWrNAHRM3Z/18KO83GAFr/QUfQbdXlzcd3x2vD0/V3z+G
 ENSg==
X-Gm-Message-State: AOAM530lC/L6kqlq9ta1GwKN3PL5xiKOyReOh0VT1GLzEti9WWb5Ne75
 4yczVa3U8UII2sCtMi+ZIMs=
X-Received: by 2002:a7b:cf16:: with SMTP id l22mr5576wmg.26.1616438822230;
 Mon, 22 Mar 2021 11:47:02 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id j14sm20769668wrw.69.2021.03.22.11.47.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 11:47:01 -0700 (PDT)
Subject: Re: [PATCH v3 2/5] tests/acceptance/boot_linux_console: remove
 Armbian 19.11.3 bionic test for orangepi-pc machine
To: Willian Rampazzo <wrampazz@redhat.com>
References: <20210304203540.41614-1-nieklinnenbank@gmail.com>
 <20210304203540.41614-3-nieklinnenbank@gmail.com>
 <CAKJDGDZq_ioF91BUWRo_y0GKYGbjgZa46Pt83wp7t3b_ZC=ixw@mail.gmail.com>
 <4d6d2e89-1152-249b-fe55-d1b611fd77e8@redhat.com>
 <CAPan3WqJHFy=GKVXFHgDbTimmZsBueUUhxvs4L+D58J-JQF3ew@mail.gmail.com>
 <CAKJDGDaUrbVpmNRvJvc+psWXzNUk6s=u8NxsR6E727UjiwsjeQ@mail.gmail.com>
 <CAKJDGDZ2yf_Z1y6qxmet=6rtH90C1BZ_cOGNW41Jk-d1EzJFwQ@mail.gmail.com>
 <fe4d5ba3-643a-70c0-417f-73d5ccb5acda@amsat.org>
 <CAKJDGDZtNhro8YhCQVatO8Xw5riwz7593mmg9r4HaMDn+vC1ZQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e7768c98-752c-177d-8c5c-2979d8d22a3e@amsat.org>
Date: Mon, 22 Mar 2021 19:47:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAKJDGDZtNhro8YhCQVatO8Xw5riwz7593mmg9r4HaMDn+vC1ZQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>,
 Cleber Rosa Junior <crosa@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cRU5p5Jy9U2A

On 3/22/21 6:18 PM, Willian Rampazzo wrote:
> Hi Philippe,
> 
> On Mon, Mar 22, 2021 at 1:54 PM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Hi Willian,
>>
>> On 3/8/21 9:44 PM, Willian Rampazzo wrote:
>>> On Mon, Mar 8, 2021 at 5:41 PM Willian Rampazzo <wrampazz@redhat.com> wrote:
>>>>
>>>> On Mon, Mar 8, 2021 at 5:32 PM Niek Linnenbank <nieklinnenbank@gmail.com> wrote:
>>>>>
>>>>> Hi Philippe, Willian,
>>>>>
>>>>> On Mon, Mar 8, 2021 at 8:52 AM Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>>>>>
>>>>>> On 3/5/21 4:16 PM, Willian Rampazzo wrote:
>>>>>>> On Thu, Mar 4, 2021 at 5:44 PM Niek Linnenbank <nieklinnenbank@gmail.com> wrote:
>>>>>>>>
>>>>>>>> The image for Armbian 19.11.3 bionic has been removed from the armbian server.
>>>>>>>> Without the image as input the test arm_orangepi_bionic_19_11 cannot run.
>>>>>>>>
>>>>>>>> This commit removes the test completely and merges the code of the generic function
>>>>>>>> do_test_arm_orangepi_uboot_armbian back with the 20.08 test.
>>>>>>>>
>>>>>>>> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
>>>>>>>> ---
>>>>>>>>  tests/acceptance/boot_linux_console.py | 72 ++++++++------------------
>>>>>>>>  1 file changed, 23 insertions(+), 49 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
>>>>>>>> index eb01286799..9fadea9958 100644
>>>>>>>> --- a/tests/acceptance/boot_linux_console.py
>>>>>>>> +++ b/tests/acceptance/boot_linux_console.py
>>>>>>>> @@ -802,7 +802,29 @@ def test_arm_orangepi_sd(self):
>>>>>>>>          # Wait for VM to shut down gracefully
>>>>>>>>          self.vm.wait()
>>>>>>>>
>>>>>>>> -    def do_test_arm_orangepi_uboot_armbian(self, image_path):
>>>>>>>> +    @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
>>>>>>>> +                'Test artifacts fetched from unreliable apt.armbian.com')
>>>>>>>> +    @skipUnless(os.getenv('AVOCADO_ALLOW_LARGE_STORAGE'), 'storage limited')
>>>>>>>> +    def test_arm_orangepi_bionic_20_08(self):
>>>>>>>> +        """
>>>>>>>> +        :avocado: tags=arch:arm
>>>>>>>> +        :avocado: tags=machine:orangepi-pc
>>>>>>>> +        :avocado: tags=device:sd
>>>>>>>> +        """
>>>>>>>> +
>>>>>>>> +        # This test download a 275 MiB compressed image and expand it
>>>>>>>> +        # to 1036 MiB, but the underlying filesystem is 1552 MiB...
>>>>>>>> +        # As we expand it to 2 GiB we are safe.
>>>>>>>> +
>>>>>>>> +        image_url = ('https://dl.armbian.com/orangepipc/archive/'
>>>>>>>> +                     'Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz')
>>>>>>>
>>>>>>> The Armbian 20 is not available on this link anymore. I can browse just 21.
>>>>>>
>>>>>> Cat-and-mouse game *sigh*.
>>
>> 2021-03-22 17:18:10,701 download         L0067 INFO | Fetching
>> https://archive.armbian.com/orangepipc/archive/Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz
>> -> /home/phil/avocado/da
>> ta/cache/by_location/f2eb27a12b81ce15e93f340fabbced2136af1caa/Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz.nfwdzivg
>> 2021-03-22 17:18:11,263 asset            L0136 INFO | Temporary asset
>> file unavailable due to failed download attempt.
>> 2021-03-22 17:18:11,263 asset            L0368 ERROR| URLError: <urlopen
>> error [Errno 113] No route to host>
>>
>> It might be a temporary problem, but looking long term the
>> current setup doesn't scale IMHO.
>>
> 
> Have you changed something in the test? The test is supposed to skip
> when the asset is not available in the cache. What was the result of
> this test execution? Skip, fail, or error? If it was not Skip, we need
> to investigate what happened.

No change, on commit b1847509268.

The result was all good but 1 "Cancelled" so I looked at the job.log.

All good IMO.

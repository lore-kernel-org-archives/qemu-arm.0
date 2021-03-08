Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1615510lfg;
        Sun, 7 Mar 2021 23:52:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw20AH1TDqnFFhP5xt1sHBcjEoSZ06QiEWszwJ7RRL1HsrDCVXG/KqKzgMDl+9sBdXcMaox
X-Received: by 2002:a02:3304:: with SMTP id c4mr22198149jae.68.1615189950149;
        Sun, 07 Mar 2021 23:52:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615189950; cv=none;
        d=google.com; s=arc-20160816;
        b=cttinHzqzeKv1RiVdVsEX79jy6NcoiPo165WEbZ3Q+FpeVooprJmqZyis8ZIcX8md8
         ADeKD/vqqH4RSPSh/7iz+C7kyxaNObU2wdyVaSjL2M+UaFR/wZ3qAM7ZlVAFli315LOF
         pYZNetQgldUff3YbQljRRKpvEnKs1HSHu/ElOgXcHyzXW4V6SLUGHkp4o7fyEdF5whWJ
         f4b4y9Xyy+Envz2aa7uFKXHW2AHgGBN1gmQRhiJMICjGqU6gqmEB/Dm44GdztsPHNbvy
         NXYm2316JKEYnEXgN41FLG3+844AbfkwFZrguhXwu2pE7vqiYM+vub70gOWS0XlUGv8e
         Yufg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=kCHG6ZonLLPeUU16u6jdq2kF6bKbHFf90lxlB6JWyzI=;
        b=YAs0QTdwKnmEErTpqJjcCRE2niOI0Z98wwunLMxCo5tprPO6CQZwzIpfGx1RWc6yYG
         qXPtKWMz6bDW4kostcpuEMO8FXiErqM85ttQKeFsqHSskv7ueJwO0tbEqH1t8mW7Pc9N
         8nv0r0mQU7ex3bJusNaJBvu8CeDYVr6SHr0cla+snxYVwbmIkDB7Q9UbFnvznY6R14WH
         oBBYhL1sFjPdf1tJXjasY8cqhk8B4rICbLHQaT4Qfnp09WUYEd0o7UzkWxuSyNMZX1YX
         uWgA4atX9QSxmFjxXXlHZFF9tZ0em4uMe2CcKIO7ixBQ3mIZqT7REmUtKFzBS1lZPErQ
         vlAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AW62awBH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k9si10562051ilv.123.2021.03.07.23.52.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 07 Mar 2021 23:52:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AW62awBH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJAgn-00028I-E8
	for alex.bennee@linaro.org; Mon, 08 Mar 2021 02:52:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJAgf-00027s-0d
 for qemu-arm@nongnu.org; Mon, 08 Mar 2021 02:52:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJAgd-0002Ac-Bb
 for qemu-arm@nongnu.org; Mon, 08 Mar 2021 02:52:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615189938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kCHG6ZonLLPeUU16u6jdq2kF6bKbHFf90lxlB6JWyzI=;
 b=AW62awBHMq/K5s50RVJ1Lr/gyIPYXpaSFZCk0dUjO4I1of3NhHKJxE5DUnmkHVDim+sxE+
 GVSKutCprh190Vr3cnIIicEwO6zzcb6fvzar5KFSgsmL86GjK9Y9LhrfTSYYr0o9zm5Ve+
 ilwJcPJGgiU/EeVMmBzgrKssTYcr49c=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-4B7aL_1_MPePHXJngAA2aw-1; Mon, 08 Mar 2021 02:52:15 -0500
X-MC-Unique: 4B7aL_1_MPePHXJngAA2aw-1
Received: by mail-wr1-f71.google.com with SMTP id e29so4454480wra.12
 for <qemu-arm@nongnu.org>; Sun, 07 Mar 2021 23:52:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kCHG6ZonLLPeUU16u6jdq2kF6bKbHFf90lxlB6JWyzI=;
 b=V0geZwXZQ3Vx40l9xQWk+WUaGZ/qShlQhzoQ3JzpCIxNnxLFgt8pwAqor9jcZmMxPH
 gFDFH3fDHeWACOZ4t/0Dq+0gEor/zdDNP9YcV5KhIVdkDEFwvvJS27rHz9v35sTIlDtI
 zGYEIl4nbjYybpkSZFA/zAfwrCr7MTBWOWhrhiDEvqrg3gfeqc2WDF4fX5q3AxBEgDkH
 JZlGrg6d5+aWaK74BaJoDNLMnCGv4QsWo96hAz+3F/IByEXZQ5S60RaulVk98LTr79GT
 GJXEtpc01GEkl4Dl30MHWXorcy7/K6+2pIIMHu4PtVd7m9sELurY7wWhSk+NSIubRMO5
 CZnw==
X-Gm-Message-State: AOAM530DJhTytFQMBTlAiCtAfM93G2rhJ50x3UFCNWg9DnLVpVAMGIAn
 +YvJfGW2pOTs7XmE0hXo7pd/S6UZT/pt081OoGB1OrLNLxbApVRUq7/cl4Ag4zl+dElhQSxdxVA
 z8M8kA64LOaZS
X-Received: by 2002:a5d:6049:: with SMTP id j9mr1102390wrt.117.1615189934462; 
 Sun, 07 Mar 2021 23:52:14 -0800 (PST)
X-Received: by 2002:a5d:6049:: with SMTP id j9mr1102371wrt.117.1615189934291; 
 Sun, 07 Mar 2021 23:52:14 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id k11sm17688212wmj.1.2021.03.07.23.52.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Mar 2021 23:52:13 -0800 (PST)
Subject: Re: [PATCH v3 2/5] tests/acceptance/boot_linux_console: remove
 Armbian 19.11.3 bionic test for orangepi-pc machine
To: Willian Rampazzo <wrampazz@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>
References: <20210304203540.41614-1-nieklinnenbank@gmail.com>
 <20210304203540.41614-3-nieklinnenbank@gmail.com>
 <CAKJDGDZq_ioF91BUWRo_y0GKYGbjgZa46Pt83wp7t3b_ZC=ixw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4d6d2e89-1152-249b-fe55-d1b611fd77e8@redhat.com>
Date: Mon, 8 Mar 2021 08:52:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAKJDGDZq_ioF91BUWRo_y0GKYGbjgZa46Pt83wp7t3b_ZC=ixw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 b.galvani@gmail.com, qemu-arm@nongnu.org,
 Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>,
 Cleber Rosa Junior <crosa@redhat.com>,
 Philippe Mathieu Daude <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jMMuFhuYw/Vj

On 3/5/21 4:16 PM, Willian Rampazzo wrote:
> On Thu, Mar 4, 2021 at 5:44 PM Niek Linnenbank <nieklinnenbank@gmail.com> wrote:
>>
>> The image for Armbian 19.11.3 bionic has been removed from the armbian server.
>> Without the image as input the test arm_orangepi_bionic_19_11 cannot run.
>>
>> This commit removes the test completely and merges the code of the generic function
>> do_test_arm_orangepi_uboot_armbian back with the 20.08 test.
>>
>> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
>> ---
>>  tests/acceptance/boot_linux_console.py | 72 ++++++++------------------
>>  1 file changed, 23 insertions(+), 49 deletions(-)
>>
>> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
>> index eb01286799..9fadea9958 100644
>> --- a/tests/acceptance/boot_linux_console.py
>> +++ b/tests/acceptance/boot_linux_console.py
>> @@ -802,7 +802,29 @@ def test_arm_orangepi_sd(self):
>>          # Wait for VM to shut down gracefully
>>          self.vm.wait()
>>
>> -    def do_test_arm_orangepi_uboot_armbian(self, image_path):
>> +    @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
>> +                'Test artifacts fetched from unreliable apt.armbian.com')
>> +    @skipUnless(os.getenv('AVOCADO_ALLOW_LARGE_STORAGE'), 'storage limited')
>> +    def test_arm_orangepi_bionic_20_08(self):
>> +        """
>> +        :avocado: tags=arch:arm
>> +        :avocado: tags=machine:orangepi-pc
>> +        :avocado: tags=device:sd
>> +        """
>> +
>> +        # This test download a 275 MiB compressed image and expand it
>> +        # to 1036 MiB, but the underlying filesystem is 1552 MiB...
>> +        # As we expand it to 2 GiB we are safe.
>> +
>> +        image_url = ('https://dl.armbian.com/orangepipc/archive/'
>> +                     'Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz')
> 
> The Armbian 20 is not available on this link anymore. I can browse just 21.

Cat-and-mouse game *sigh*.


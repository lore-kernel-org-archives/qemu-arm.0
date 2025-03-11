Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp1979114njc;
        Tue, 11 Mar 2025 09:30:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW7ixTIQ/XLy4oqIJLlIlcb0qBC3OjiESSZ6DKTekvlsYKowTfgb87SqMfuCeu1+p3fdePgWN0IQm7Itg==@linaro.org
X-Google-Smtp-Source: AGHT+IFd/CVeGXoviJWG28DPFP4OgBZu7+ChJN4KgIur0CRaSVmLI+QYRf3QN5YE1yAJW2GSUKv9
X-Received: by 2002:a05:6122:801:b0:523:e9d2:404d with SMTP id 71dfb90a1353d-523e9d2414cmr7897532e0c.11.1741710650116;
        Tue, 11 Mar 2025 09:30:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741710650; cv=none;
        d=google.com; s=arc-20240605;
        b=Gq4WimQLhG6YOQaodgrOIg9HYwYT8fam5iDY7YMyjoY+DzO1uTc2IfPg+IeDegyLyz
         DoHWPlahA+qxsnZFx/OAYk69DoaY0gVxcxvz1sl6NbavRgNckZUYzgaghXIlYlwN5i6s
         m8JJMqkvm7R1Rx70JqyvZNr7i81PHoVQ78qjYyYOzh/hvHn1QpROngU7E7g2w/W1mcP6
         NsQdkRh8qgT8f3VFqTwRb9+mD27vI04Weua6Hwvba8jzPpKulyyU1rKV+AdrRuimJnGp
         16YkoaCQdnd/XdRDLxOwwKI+I7EpYcUVB1GTWMIvi004i8cSBu4ZY4I/yOx6XHebHTry
         A/xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=gvW/5G6Q0o35IFHWkI1ctZoRXpbF5XVgT4Z39z0aScA=;
        fh=e4oaLR6JeAwNfZ07Y46RG/PZ1MmpIJUUz63JxHQe3tM=;
        b=fXgz3kwX8GA5j3gCbFxbo2tPvKlbLqbPmxor9cVA/8Ml4o9NS0juqT6nxixFwc0Fks
         PbLJfWFUJI0XD60p1xjhao9C0Qjz0iCoZrIN1Jr+AfK05fJbqrVGbep5bW58p94lFlZy
         IXVyKVvuFJYnHRuWw1/Q69FxUspp1InoMvkMCqYBvT5W3cVXknapY3BNfNgOVPDCHaA1
         DsPDGovlO8XTS9NMV5XtZSNwTntvFuM/OkCdPLe9Nw8OSmEqShjzaG+KfWFPfGNKZ0Cv
         o2nenwdozuKH1VbN4OeGwp9OHvONZPk1XBXXS7NVir3JL7K4abbNMyk9Jparf/YNpUDs
         VhhA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bZpDrMSN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-5240073eba7si1357400e0c.106.2025.03.11.09.30.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Mar 2025 09:30:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bZpDrMSN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ts2V6-0004bs-NE; Tue, 11 Mar 2025 12:30:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ts2Ui-0004FM-65
 for qemu-arm@nongnu.org; Tue, 11 Mar 2025 12:30:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1ts2Uf-0003AQ-Br
 for qemu-arm@nongnu.org; Tue, 11 Mar 2025 12:30:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741710610;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gvW/5G6Q0o35IFHWkI1ctZoRXpbF5XVgT4Z39z0aScA=;
 b=bZpDrMSNcuAHkWoc7iGoiXxUUCaiQtmytW0ogGKKXr4cT9gWDg7JDpCveHxOGPfVMG7LLl
 CxbPrsl5C3T3S0JVKxS/Xu8k3Q5s7PJwCv15sg5tHtmwL2kqKlYcNOHigGfCRDuxdGF1fF
 Pfmgqoxp6c99mbv91tUNKLjLyF3D6rs=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-191-fE0UnZDdN_KYSDt1pcIR5w-1; Tue, 11 Mar 2025 12:30:09 -0400
X-MC-Unique: fE0UnZDdN_KYSDt1pcIR5w-1
X-Mimecast-MFC-AGG-ID: fE0UnZDdN_KYSDt1pcIR5w_1741710609
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c0c1025a6cso1764801485a.0
 for <qemu-arm@nongnu.org>; Tue, 11 Mar 2025 09:30:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741710609; x=1742315409;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gvW/5G6Q0o35IFHWkI1ctZoRXpbF5XVgT4Z39z0aScA=;
 b=NdxLdtlmUDEXGWE7mbdacQ8u9k5Fy+QlMFVeHmbp5u8z+R9mPF6QrtXcn10U4+QAdU
 bIlBI6rWgwFAfaUw5+jS4xfip3Zd7fSPeqPsPB8MC3T6Gu9LLOSiPeaDvMbLOiy6quL0
 fsFXCb8omU2gWFPoYAkYhepjWe5/7/oX0Ug5A8PaBHTWjdmU4GeVC7PGz9fYUanCmf+2
 zRyOII5Zah6p9y9TwEeDa54yE4OaIE2L4lwKUxcZxTaPKHoAp8nQx5Id8c1LIN//sVPK
 gLQncE1JBaMM09GvBrEtfCYEBDZ7+Mv5+Y5gE0wuUlEXqxoLnrw0C5gEHRB+O8I5kaJu
 hRRQ==
X-Gm-Message-State: AOJu0YwllNGwVnamPR339do6zaeMBmweqejDcWeQIeSMVRGF2FZFW/g5
 VaDLWB4UrFbUH0Ggcte2UVsThCPcudS6IQkxVBJK4oNenLz6lahG7Zgyk/PYX69L/zZif5by99n
 ITpeM65LngVxPK9CHg1ZLpZ3C7A0ufm6Fe4abwVRlil8/gJfZgw==
X-Gm-Gg: ASbGncvjAgm3g11Xxbbcvez/2XeVLxZ4OLJRfhna4412NArsd6+tYry6IqfS3LcjyZV
 WfWIXlx+c/Q/TtglzcpfZz1CQTbAvJx/d5Ez9fNDP6NEOJgD5+5dv+2rqsL1fVE1AzRepcunusx
 pbvcpGA+ed4SiZrLLRGaLpIXiDgJ0D72avDZ+bXJvSQqBC6qMTqSWwgVNsfEZF2swuG6mgLePO2
 ItykVZqtJQTWG0pg/iltVTaB4+02oSniPA8SKY8D5X8UUWofwOB3LuKO7TLwjo4j3DZHFoeaTI+
 4XlVk4XPTUWah3Jb3k7/f27MHpYUoqFiSKyOyWuYX+wCY0h0OAcgctrH4Nm5h1s=
X-Received: by 2002:a05:620a:660a:b0:7c5:48bc:8c89 with SMTP id
 af79cd13be357-7c548bc8ecfmr1706849085a.27.1741710609383; 
 Tue, 11 Mar 2025 09:30:09 -0700 (PDT)
X-Received: by 2002:a05:620a:660a:b0:7c5:48bc:8c89 with SMTP id
 af79cd13be357-7c548bc8ecfmr1706845385a.27.1741710609067; 
 Tue, 11 Mar 2025 09:30:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c5414c8067sm542616585a.59.2025.03.11.09.30.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 09:30:08 -0700 (PDT)
Message-ID: <baf96cd3-2434-444a-8a16-87abd6e14bcd@redhat.com>
Date: Tue, 11 Mar 2025 17:30:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-10.1] tests/functional: Convert the SMMU test to the
 functional framework
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250311104920.364102-1-thuth@redhat.com>
 <4b7d75f1-12df-44ab-9435-df517beff716@redhat.com>
 <39ad1fef-f5cc-44f6-be4d-84a597b3f9f6@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <39ad1fef-f5cc-44f6-be4d-84a597b3f9f6@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: i1jLhJsm4Al2hTwGwrFMRZlUKsP5leQ__yFrYK2znqI_1741710609
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: D1UTlrMfP0R9

Hi Thomas,


On 3/11/25 4:24 PM, Thomas Huth wrote:
> On 11/03/2025 15.00, Eric Auger wrote:
>> Hi Thomas,
>>
>>
>> On 3/11/25 11:49 AM, Thomas Huth wrote:
>>> This test was using cloudinit and a "dnf install" command in the guest
>>> to exercise the NIC with SMMU enabled. Since we don't have the
>>> cloudinit
>>> stuff in the functional framework and we should not rely on having
>>> access
>>> to external networks (once our ASSETs have been cached), we rather boot
>>> into the initrd first, manually mount the root disk and then use the
>>> check_http_download() function from the functional framework here
>>> instead
>>> for testing whether the network works as expected.
>>>
>>> Unfortunately, there seems to be a small race when using the files
>>> from Fedora 33: To enter the initrd shell, we have to send a "return"
>>> once. But it does not seem to work if we send it too early. Using a
>>> sleep(0.2) makes it work reliably for me, but to make it even more
>>> unlikely to trigger this situation, let's better limit the Fedora 33
>>> tests to only run with KVM.
>>>
>>> Finally, while we're at it, we also add some lines for testing writes
>>> to the hard disk, as we already do it in the test_intel_iommu test.
>>
>> for your info it does not apply anymore on mainline after latest appied
>> functional test additions.
> ...
>>> +    ASSET_KERNEL_F31 = Asset(
>>> +       
>>> ('https://archives.fedoraproject.org/pub/archive/fedora/linux/'
>>> +         'releases/31/Server/aarch64/os/images/pxeboot/vmlinuz'),
>>> +       
>>> '413c7f95e7f40cfa3e73290ffae855c88fae54cccc46123a4b4ed2db7d5c2120')
>> the hash seems wrong for the vmlinuz. I get
>> Exception: Hash of
>> https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/31/Server/aarch64/os/images/pxeboot/vmlinuz
>>
>> does not match
>> 413c7f95e7f40cfa3e73290ffae855c88fae54cccc46123a4b4ed2db7d5c2120
>
> D'oh, I got tricked by "wget". I used wget to download the asset to
> manually calculate the sha256sum, then manually copied the asset into
> my cache to avoid a second download.
> But wget apparently unzips the kernel:
>
> $ wget
> https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/31/Server/aarch64/os/images/pxeboot/vmlinuz
> $ sha256sum vmlinuz
> 413c7f95e7f40cfa3e73290ffae855c88fae54cccc46123a4b4ed2db7d5c2120  vmlinuz
> $ ls -l vmlinuz
> -rw-r--r--. 1 thuth thuth 25885184 Oct 21  2019 vmlinuz
>
> While curl gives the correct results:
>
> $ curl -O
> https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/31/Server/aarch64/os/images/pxeboot/vmlinuz
> $ sha256sum vmlinuz
> 3ae07fcafbfc8e4abeb693035a74fe10698faae15e9ccd48882a9167800c1527  vmlinuz
> $ ls -l vmlinuz
> -rw-r--r--. 1 thuth thuth  9027813 Mar 11 16:13 vmlinuz
>
> This should fix the issue:
>
> diff --git a/tests/functional/test_aarch64_smmu.py
> b/tests/functional/test_aarch64_smmu.py
> index bba8599401c..4f0492ca50d 100755
> --- a/tests/functional/test_aarch64_smmu.py
> +++ b/tests/functional/test_aarch64_smmu.py
> @@ -123,7 +123,7 @@ def run_and_check(self, filename, hashsum):
>      ASSET_KERNEL_F31 = Asset(
>          ('https://archives.fedoraproject.org/pub/archive/fedora/linux/'
>           'releases/31/Server/aarch64/os/images/pxeboot/vmlinuz'),
> -       
> '413c7f95e7f40cfa3e73290ffae855c88fae54cccc46123a4b4ed2db7d5c2120')
> +       
> '3ae07fcafbfc8e4abeb693035a74fe10698faae15e9ccd48882a9167800c1527')
>
>      ASSET_INITRD_F31 = Asset(
>          ('https://archives.fedoraproject.org/pub/archive/fedora/linux/'
> @@ -165,7 +165,7 @@ def test_smmu_noril_nostrict(self):
>      ASSET_KERNEL_F33 = Asset(
>          ('https://archives.fedoraproject.org/pub/archive/fedora/linux/'
>           'releases/33/Server/aarch64/os/images/pxeboot/vmlinuz'),
> -       
> '0ef9e34f80b49fa2ac098899b27075e95c11d5b646f6ca4df2e89237a40f9e4f')
> +       
> 'd8b1e6f7241f339d8e7609c456cf0461ffa4583ed07e0b55c7d1d8a0c154aa89')
>
>      ASSET_INITRD_F33 = Asset(
>          ('https://archives.fedoraproject.org/pub/archive/fedora/linux/'

yep it fixes the issue

python3.9 ../tests/functional/test_aarch64_smmu.py
TAP version 13
ok 1 test_aarch64_smmu.SMMU.test_smmu_noril
ok 2 test_aarch64_smmu.SMMU.test_smmu_noril_nostrict
ok 3 test_aarch64_smmu.SMMU.test_smmu_noril_passthrough
ok 4 test_aarch64_smmu.SMMU.test_smmu_ril
ok 5 test_aarch64_smmu.SMMU.test_smmu_ril_nostrict
ok 6 test_aarch64_smmu.SMMU.test_smmu_ril_passthrough
1..6

The conversion looks good to me. thank you for doing it!

With above fix and straightforward rebase on top of mainline, feel free
to add

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Eric Auger <eric.auger@redhat.com>

Eric

>
> Sorry for the confusion.
>
>  Thomas
>


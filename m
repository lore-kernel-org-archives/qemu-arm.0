Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp1935613njc;
        Tue, 11 Mar 2025 08:25:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVSlsv58wVPnMgf0GGipkLOfTwPB7+cKB4IfofIyDpKBDRWdzMwmAO/UJzuEnULn4Q5FziusVbv2CETFA==@linaro.org
X-Google-Smtp-Source: AGHT+IFbUIWm2Uipg4PoL9MMFQf8+t8YMMQD0sxINZOgunP5lFGyCMTnXUAe1X0qoPiMxUzbzmlZ
X-Received: by 2002:a05:6214:76e:b0:6e2:4da9:4e2d with SMTP id 6a1803df08f44-6ea51edeb4fmr53228816d6.9.1741706725006;
        Tue, 11 Mar 2025 08:25:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741706724; cv=none;
        d=google.com; s=arc-20240605;
        b=CpTSpBPo9DDfUBhZrgUoCb6VA7X25pC/EzVX9uq4+vNR44MDAE3ao3ZGqa6uK+bm4p
         v6IuhCFX5epVJQP/2V6GQ4n9JZkbwm/FtPu6vBCFmizt01mGdp+e05YHPpdOWhpO/7g+
         ILjH3w5NeNvZRDfhsCYXWdVGOyXPCyKH22Xn/Yn9ZLF768CFOnfeSwoAiO2iCWgwbr6I
         GScFKvpFMj49k6EfheUgsLpe0p2AHaNBvuqAwX+JOlizG29piyNj+RlyuB5C4JNsnFY/
         /J78/ZA/bFm78jIUL6ISE8krwTzyesHLPoKBg3KA0mSrYD+5Mt41vtsyCX9L7PB41kfg
         P0Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=LAJ3DY5BOA4zXT3h54fG3oDbwrEXOgXCIakN900wo/Y=;
        fh=K/q5EsRBApswgKnHgtm4Kw9+covudPE+n6GyAeUKdto=;
        b=Koi6Ls83y530rkc4aAqfigU+zpbOZu/CbJyAiSmM9AQQ1qZj42NbapLwC9atWImOZF
         2McMRENvY9ReJ//QxDFM8CNW59VQNBJeN1gTq8p09+2HZDHTulwJkRCPO6txJNYgebxb
         5WZeAahlcIxUBfaHc6zFGyrrr5UR1K7kxca5zHHr745pyElCAx7xHcJJ8DnC6/YPLhto
         NTO00M14tXkXawHrkiGHshMmMvh7+xcphz5YhyNtBjNr4IYz1xTtwYEDMQ3u24ALK+GN
         gTFgIh3C/OSzKo3JEpksocN5tjWWM6swyD04YPXDYHAzgWXhL4v+zJnGQy6BxnLR7ZMY
         XC/w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SnfbIa8i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8f7468c52si110808636d6.459.2025.03.11.08.25.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Mar 2025 08:25:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SnfbIa8i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ts1Tq-0001S8-Cb; Tue, 11 Mar 2025 11:25:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ts1TP-0001D9-Td
 for qemu-arm@nongnu.org; Tue, 11 Mar 2025 11:24:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ts1TM-0007Rx-VY
 for qemu-arm@nongnu.org; Tue, 11 Mar 2025 11:24:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741706688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LAJ3DY5BOA4zXT3h54fG3oDbwrEXOgXCIakN900wo/Y=;
 b=SnfbIa8ix84e+KRMBgDWkTAZxcORYFE46y5cKyMyjU4AeKY5rZbo6oKvdVXtAs51uaAsBH
 s7uVii57GDaVFC1tnxeTInrLkeqOe07oPgy/ZL6N20rVo6YtDtcm/msyqt26lIr7x68nfw
 5wjBni0dDO+Ac/d0CSwBFnz+6byX77I=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-326-R1pnzrYmNye89D4SHwiysA-1; Tue, 11 Mar 2025 11:24:47 -0400
X-MC-Unique: R1pnzrYmNye89D4SHwiysA-1
X-Mimecast-MFC-AGG-ID: R1pnzrYmNye89D4SHwiysA_1741706686
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3913f97d115so1403759f8f.0
 for <qemu-arm@nongnu.org>; Tue, 11 Mar 2025 08:24:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741706686; x=1742311486;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LAJ3DY5BOA4zXT3h54fG3oDbwrEXOgXCIakN900wo/Y=;
 b=llqVF0PrDeDTpQ5kMhVgN5ywztQD4N/QRqt8CDuwDU7ZiTS3Z5v9vc7fJkIb8Mqzdg
 kSI2gFr5VpzC9zuMdBn1Hz0mlB1+hps3xm7BrjcWsIkUnZpcumXohcxO8c+zztGltTJG
 rp94aL88x65qNmWCAVajCSaItizEfmKNRP7n0JczMuPENNvso+J7ls5m0nu2xE3/6hNo
 votlIo8GIOkUwwb1zZ6grbigbGwe8+aggtKz5fQbYJ8MMTuxiWn+hMvPLZkKSh5hOaNx
 a4F9LVPxAa2w9Fx4ELpEVTHECpvD3qN7yvvWRTzR6ezKRfbWELRJvYkRTBhJuAfZ00XK
 S5Rg==
X-Gm-Message-State: AOJu0Yxx+DJSIF5PKRZUuRaBuZHRRF+whQrDb7bjr0QT/I12D9Ik76XA
 ZCVH+kj+0A9vMvIlIebbZUvjFSNbfBHBSlkL+F3jHvWeRDUB7s3Z6O4YcGhdDTvLClDJ54gz6AO
 E0bGW1v93Tl43G6QdWo+6OCGgm2DdTZ6W/trudc1ms1Lz/nxKOw==
X-Gm-Gg: ASbGncs3vB3N0A+n6kUOiBlHPsniB04SJHtVMyFIPvwvznIugTgPJqrVEnuzXzTfJ/u
 o/CjDnR6C5p/nG5tRboeu6OowYghnGrtkfL525dP5VbCXfKtU3VrwoqgFvtoGZ/qYJokKJjYU2M
 9PH3RD52NaYPemNdfyZIky17zGV2ks+YuJTtjXBh8m9C0UwXjEhv78bOm/mZEdF1Ld3mXnVtxrg
 NKAqOK5RxvsWYTMCkQvN47qJ6UxXt8+h1lMNSjIR8W//+Kd9xsxFDhykM2nMNAfKPCVh3Ew2uou
 6bnTTgf8MwyT+FdnoFv2yeKemhCcLYz/ErRt7sbjRacE+gI=
X-Received: by 2002:a5d:47c8:0:b0:38d:b028:d906 with SMTP id
 ffacd0b85a97d-3926d1238e1mr5848640f8f.21.1741706685680; 
 Tue, 11 Mar 2025 08:24:45 -0700 (PDT)
X-Received: by 2002:a5d:47c8:0:b0:38d:b028:d906 with SMTP id
 ffacd0b85a97d-3926d1238e1mr5848614f8f.21.1741706685298; 
 Tue, 11 Mar 2025 08:24:45 -0700 (PDT)
Received: from [192.168.0.7] (ip-109-42-51-149.web.vodafone.de.
 [109.42.51.149]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfb79cfsm18468517f8f.10.2025.03.11.08.24.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 08:24:44 -0700 (PDT)
Message-ID: <39ad1fef-f5cc-44f6-be4d-84a597b3f9f6@redhat.com>
Date: Tue, 11 Mar 2025 16:24:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-10.1] tests/functional: Convert the SMMU test to the
 functional framework
To: eric.auger@redhat.com, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250311104920.364102-1-thuth@redhat.com>
 <4b7d75f1-12df-44ab-9435-df517beff716@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <4b7d75f1-12df-44ab-9435-df517beff716@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UYnPex0AYJxjGCehc4tm3QMmi70c_Lq4ZzkbRMKo_wI_1741706686
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: rUE1r+Ix22/E

On 11/03/2025 15.00, Eric Auger wrote:
> Hi Thomas,
> 
> 
> On 3/11/25 11:49 AM, Thomas Huth wrote:
>> This test was using cloudinit and a "dnf install" command in the guest
>> to exercise the NIC with SMMU enabled. Since we don't have the cloudinit
>> stuff in the functional framework and we should not rely on having access
>> to external networks (once our ASSETs have been cached), we rather boot
>> into the initrd first, manually mount the root disk and then use the
>> check_http_download() function from the functional framework here instead
>> for testing whether the network works as expected.
>>
>> Unfortunately, there seems to be a small race when using the files
>> from Fedora 33: To enter the initrd shell, we have to send a "return"
>> once. But it does not seem to work if we send it too early. Using a
>> sleep(0.2) makes it work reliably for me, but to make it even more
>> unlikely to trigger this situation, let's better limit the Fedora 33
>> tests to only run with KVM.
>>
>> Finally, while we're at it, we also add some lines for testing writes
>> to the hard disk, as we already do it in the test_intel_iommu test.
> 
> for your info it does not apply anymore on mainline after latest appied
> functional test additions.
...
>> +    ASSET_KERNEL_F31 = Asset(
>> +        ('https://archives.fedoraproject.org/pub/archive/fedora/linux/'
>> +         'releases/31/Server/aarch64/os/images/pxeboot/vmlinuz'),
>> +        '413c7f95e7f40cfa3e73290ffae855c88fae54cccc46123a4b4ed2db7d5c2120')
> the hash seems wrong for the vmlinuz. I get
> Exception: Hash of
> https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/31/Server/aarch64/os/images/pxeboot/vmlinuz
> does not match
> 413c7f95e7f40cfa3e73290ffae855c88fae54cccc46123a4b4ed2db7d5c2120

D'oh, I got tricked by "wget". I used wget to download the asset to manually 
calculate the sha256sum, then manually copied the asset into my cache to 
avoid a second download.
But wget apparently unzips the kernel:

$ wget 
https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/31/Server/aarch64/os/images/pxeboot/vmlinuz
$ sha256sum vmlinuz
413c7f95e7f40cfa3e73290ffae855c88fae54cccc46123a4b4ed2db7d5c2120  vmlinuz
$ ls -l vmlinuz
-rw-r--r--. 1 thuth thuth 25885184 Oct 21  2019 vmlinuz

While curl gives the correct results:

$ curl -O 
https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/31/Server/aarch64/os/images/pxeboot/vmlinuz
$ sha256sum vmlinuz
3ae07fcafbfc8e4abeb693035a74fe10698faae15e9ccd48882a9167800c1527  vmlinuz
$ ls -l vmlinuz
-rw-r--r--. 1 thuth thuth  9027813 Mar 11 16:13 vmlinuz

This should fix the issue:

diff --git a/tests/functional/test_aarch64_smmu.py 
b/tests/functional/test_aarch64_smmu.py
index bba8599401c..4f0492ca50d 100755
--- a/tests/functional/test_aarch64_smmu.py
+++ b/tests/functional/test_aarch64_smmu.py
@@ -123,7 +123,7 @@ def run_and_check(self, filename, hashsum):
      ASSET_KERNEL_F31 = Asset(
          ('https://archives.fedoraproject.org/pub/archive/fedora/linux/'
           'releases/31/Server/aarch64/os/images/pxeboot/vmlinuz'),
-        '413c7f95e7f40cfa3e73290ffae855c88fae54cccc46123a4b4ed2db7d5c2120')
+        '3ae07fcafbfc8e4abeb693035a74fe10698faae15e9ccd48882a9167800c1527')

      ASSET_INITRD_F31 = Asset(
          ('https://archives.fedoraproject.org/pub/archive/fedora/linux/'
@@ -165,7 +165,7 @@ def test_smmu_noril_nostrict(self):
      ASSET_KERNEL_F33 = Asset(
          ('https://archives.fedoraproject.org/pub/archive/fedora/linux/'
           'releases/33/Server/aarch64/os/images/pxeboot/vmlinuz'),
-        '0ef9e34f80b49fa2ac098899b27075e95c11d5b646f6ca4df2e89237a40f9e4f')
+        'd8b1e6f7241f339d8e7609c456cf0461ffa4583ed07e0b55c7d1d8a0c154aa89')

      ASSET_INITRD_F33 = Asset(
          ('https://archives.fedoraproject.org/pub/archive/fedora/linux/'

Sorry for the confusion.

  Thomas


Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A56D116F3
	for <qemu-arm@archiver.kernel.org>; Mon,  1 Dec 2025 14:13:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vQ4ei-0006Jn-RQ; Mon, 01 Dec 2025 09:13:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vQ4ec-0006I7-9l
 for qemu-arm@nongnu.org; Mon, 01 Dec 2025 09:13:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1vQ4eZ-0007dy-U1
 for qemu-arm@nongnu.org; Mon, 01 Dec 2025 09:13:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1764598402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=usgyk0QsjJYCDbrzW2b2HFiGtJfQgbU7mj1fK/GDrKE=;
 b=Tas49/wpALWt/6ykg3/5OSWiBpYl+gahWRL46xd301tcbVmJrjkvZ7visOsja97LUB5QJ6
 Rxtqt/aSIQZnIA0oKzSn7qjjsnjIC62a4PsYsnJrlYDYN27kOiFvJ1m8m8I1RgVI7QlOQy
 tMl7qw7+AJcb0rtZiKCeAgiwisfHQg8=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-hxkiMg_7MvCOJkx6E8s3Ng-1; Mon, 01 Dec 2025 09:13:18 -0500
X-MC-Unique: hxkiMg_7MvCOJkx6E8s3Ng-1
X-Mimecast-MFC-AGG-ID: hxkiMg_7MvCOJkx6E8s3Ng_1764598396
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-297f8a2ba9eso74391795ad.3
 for <qemu-arm@nongnu.org>; Mon, 01 Dec 2025 06:13:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764598396; x=1765203196;
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o+xYVUnOHnKVt3WC6HyCn4YiTK98PeI0aheG3XdxRJA=;
 b=a+XWcTvCd2DiteUkborkHj2S7UPLo2wHd5l1ntAmLytlpLESkAPTeGAl2jWiaxwXr6
 rfrgT+JRUAr9didlCdjfb/cL2w4K0ADGxGnKmp+rDIYbp3uzeFRTAtMryq7xlR3dHhXn
 3AqiRFDWXYBV2IqVs+QPXpS7GLggjIWq+v7JS+gawv/zEw1zutPS9+zFVX7pgcBuVhgN
 vaLX0uP4ZB9Av70zkWvZ7p+kBrXl3vzvGCFqvyG77xPU1DunJBWQ25l/IarcBnZ8PNMZ
 eNggqyNTjFaq8VDbfbAFWWahq5e1Ox/Ykhk0NcWFsnEl5FwmOQLqltf0mGsDw5HnKxjb
 JlIg==
X-Gm-Message-State: AOJu0YyfbAMsmhv9pnH2wF6p83XpMOc0U++T+ckteZTvicrIn4Ai1M3w
 BeSU7+1NuTxCsLoQCkolliBM1hzHxSwPkNYW1/XGlhIxUt3RmhYJq5ZRZkl2Ktt10xIgDtaSgeV
 xC0NEeOQj8FAHbtfp2OWphV98TigkQiy83gP7QGN1xi3xK5+C+SoGTA==
X-Gm-Gg: ASbGncv/yDLBxmCEzvK+xKLSvRFCoxEbfcKSD01Bqt+ywbqOEjCB1KBG3+h//oeREii
 qiipH8cwiQtPShvO27gDFVRZWoH7hwec6+8gNsq3A24WTivJ0nXh7Vwwd9AVTAel4G5RftrdNf1
 TxUOZzpFnlMjiHpR+38uLIAyzE0qFci0dm2H8DPcu3USDGWBKSxioJ1EtV/Gv9YjzD3pFhLPn+c
 eIE7uzxF61dazxFKJZsF0zoYIVEwlbiyez6ITvtKw0F5TUwGgINoMxH4A2QjHR6tqafzzsoWZRh
 4HLTwYonobCzxtl6oTa2g1sS9Jl1nrEQvMi2TMu59frBbX5DCovuUuezUEk18RQDkrN7WP+Yueg
 GkMj1zaRoe2fKU1UuZSRwvqzLNPvlV6Q2XRPer4MvuXj6PHitPg==
X-Received: by 2002:a17:903:1904:b0:297:cf96:45bd with SMTP id
 d9443c01a7336-29b6bec4726mr383915885ad.19.1764598394870; 
 Mon, 01 Dec 2025 06:13:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH4R0QuwO6y/yeTU4vEGxR3OHAihjViLgk2Gmp/nqvfxe/BAHWL9PfJnlUGC9He6wWUXamjFw==
X-Received: by 2002:a17:903:1904:b0:297:cf96:45bd with SMTP id
 d9443c01a7336-29b6bec4726mr383914985ad.19.1764598393828; 
 Mon, 01 Dec 2025 06:13:13 -0800 (PST)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au.
 [175.34.62.5]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29bceb27504sm125763395ad.61.2025.12.01.06.13.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Dec 2025 06:13:12 -0800 (PST)
Message-ID: <12b7baee-1d6d-440a-a119-971b47d7f3ad@redhat.com>
Date: Tue, 2 Dec 2025 00:13:06 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] acpi/ghes: Error object handling improvement
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, jonathan.cameron@huawei.com,
 armbru@redhat.com, mst@redhat.com, imammedo@redhat.com, anisinha@redhat.com,
 gengdongjiu1@gmail.com, peter.maydell@linaro.org, pbonzini@redhat.com,
 shan.gavin@gmail.com
References: <20251127004435.2098335-1-gshan@redhat.com>
 <20251201131729.615abe68@foz.lan>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20251201131729.615abe68@foz.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -mUUQ9Na0VXIfBCNJ5JGgK_FxJDRS4EMfG-oi17ynTU_1764598396
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="------------XUASwuusH8ii6etp0obdtpr5"
Content-Language: en-US
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This is a multi-part message in MIME format.
--------------XUASwuusH8ii6etp0obdtpr5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mauro,

On 12/1/25 10:17 PM, Mauro Carvalho Chehab wrote:
> On Thu, 27 Nov 2025 10:44:30 +1000
> Gavin Shan <gshan@redhat.com> wrote:
> 
>> This series is curved from that for memory error handling improvement
>> [1] based on the received comments, to improve the error object handling
>> in various aspects.
>>
>> [1] https://lists.nongnu.org/archive/html/qemu-arm/2025-11/msg00534.html
>>
>> Gavin Shan (5):
>>    acpi/ghes: Automate data block cleanup in acpi_ghes_memory_errors()
>>    acpi/ghes: Abort in acpi_ghes_memory_errors() if necessary
>>    target/arm/kvm: Exit on error from acpi_ghes_memory_errors()
>>    acpi/ghes: Bail early on error from get_ghes_source_offsets()
>>    acpi/ghes: Use error_fatal in acpi_ghes_memory_errors()
> 
> Patch series look ok on my eyes.
> 
> Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> 

Thanks.

> -
> 
> Btw, what setup are you using to test memory errors? It would be
> nice to have it documented somewhere, maybe at
> docs/specs/acpi_hest_ghes.rst.
> 

I don't think docs/specs/acpi_hest_ghes.rst is the right place for that
as it's for specifications. I'm sharing how this is tested here to make
the thread complete.

- Both host and guest has 4KB page size

- Start the guest by the following command lines

   /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64                  \
   -accel kvm -machine virt,gic-version=host,nvdimm=on,ras=on               \
   -cpu host -smp maxcpus=8,cpus=8,sockets=2,clusters=2,cores=2,threads=1   \
   -m 4096M,slots=16,maxmem=128G                                            \
   -object memory-backend-ram,id=mem0,size=4096M                            \
   -numa node,nodeid=0,cpus=0-7,memdev=mem0                                 \
   -L /home/gavin/sandbox/qemu.main/build/pc-bios                           \
   -monitor none -serial mon:stdio -nographic                               \
   -gdb tcp::6666 -qmp tcp:localhost:5555,server,wait=off                   \
   -bios /home/gavin/sandbox/qemu.main/build/pc-bios/edk2-aarch64-code.fd   \
   -boot c                                                                  \
   -device pcie-root-port,bus=pcie.0,chassis=1,id=pcie.1                    \
   -device pcie-root-port,bus=pcie.0,chassis=2,id=pcie.2                    \
   -device pcie-root-port,bus=pcie.0,chassis=3,id=pcie.3                    \
      :                                                                     \
   -device pcie-root-port,bus=pcie.0,chassis=16,id=pcie.16                  \
   -drive file=/home/gavin/sandbox/images/disk.qcow2,if=none,id=drive0      \
   -device virtio-blk-pci,id=virtblk0,bus=pcie.1,drive=drive0,num-queues=4  \
   -netdev tap,id=tap1,vhost=true,script=/etc/qemu-ifup,downscript=/etc/qemu-ifdown \
   -device virtio-net-pci,bus=pcie.8,netdev=tap1,mac=52:54:00:f1:26:b0

- Trigger 'victim -d' in the guest

   guest$ ./victim -d
   physical address of (0xffff8d9b7000) = 0x1251d6000
   Hit any key to trigger error:

- Inject error to the GPA. "test.c" is attached

   host$ ./test 0x1251d6000

- Press enter on the guest so that 'victim' continues its execution

   [  435.467481] EDAC MC0: 1 UE unknown on unknown memory ( page:0x1251d6 offset:0x0 grain:1 - APEI location: )
   [  435.467542] {1}[Hardware Error]: Hardware error from APEI Generic Hardware Error Source: 0
   [  435.467543] {1}[Hardware Error]: event severity: recoverable
   [  435.467544] {1}[Hardware Error]:  Error 0, type: recoverable
   [  435.467545] {1}[Hardware Error]:   section_type: memory error
   [  435.467546] {1}[Hardware Error]:   physical_address: 0x00000001251d6000
   [  435.467547] {1}[Hardware Error]:   error_type: 0, unknown
   [  435.468380] Memory failure: 0x1251d6: recovery action for dirty LRU page: Recovered
   Bus error (core dumped)

Thanks,
Gavin





> Thanks,
> Mauro
> 

--------------XUASwuusH8ii6etp0obdtpr5
Content-Type: text/x-csrc; charset=UTF-8; name="test.c"
Content-Disposition: attachment; filename="test.c"
Content-Transfer-Encoding: base64

Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjArCi8qCiAqIFRoaXMgdGVzdCBwcm9n
cmFtIHJ1bnMgb24gdGhlIGhvc3QsIHRvIHJlY2VpdmUgR1BBIG91dHB1dGVkIGJ5ICd2aWN0aW1k
JwogKiBmcm9tIHRoZSBndWVzdC4gVGhlIEdQQSBpcyB0cmFuc2xhdGVkIHRvIEhQQSwgYW5kIHJl
Y292ZXJhYmxlIGVycm9yCiAqIGlzIGluamVjdCB0byBIUEEgYXV0b21hdGljYWxseS4KICoKICog
Tk9URTogV2UgaGF2ZSB0aGUgYXNzdW1wdGlvbiB0aGF0IHRoZSBndWVzdCBoYXMgb25seSBvbmUg
TlVNQSBub2RlIGFuZAogKiB0aGUgbWVtb3J5IGNhcGFjaXR5IGlzIDRHQi4gVGhlIHRlc3QgcHJv
Z3JhbSB3b24ndCB3b3JrIGlmIHRoZSBhc3N1bXB0aW9uCiAqIGlzIGJyb2tlbi4KICoKICogQXV0
aG9yOiBHYXZpbiBTaGFuIDxnc2hhbkByZWRoYXQuY29tPgogKi8KCiNkZWZpbmUgX0dOVV9TT1VS
Q0UKI2luY2x1ZGUgPHN0ZGlvLmg+CiNpbmNsdWRlIDxzdGRsaWIuaD4KI2luY2x1ZGUgPHN0cmlu
Zy5oPgojaW5jbHVkZSA8dW5pc3RkLmg+CiNpbmNsdWRlIDxhc3NlcnQuaD4KI2luY2x1ZGUgPGVy
cm5vLmg+CiNpbmNsdWRlIDx0aW1lLmg+CiNpbmNsdWRlIDxmY250bC5oPgojaW5jbHVkZSA8ZGly
ZW50Lmg+CiNpbmNsdWRlIDxzeXMvc3RhdC5oPgojaW5jbHVkZSA8c3lzL21tYW4uaD4KI2luY2x1
ZGUgPHN5cy93YWl0Lmg+CgojZGVmaW5lIFRFU1RfR1VFU1RfTUVNX1NJWkUJMHgxMDAwMDAwMDAJ
LyogNEdCICovCiNkZWZpbmUgVEVTVF9HVUVTVF9NRU1fU1RBUlQJMHgwNDAwMDAwMDAJLyogMUdC
ICovCiNkZWZpbmUgVEVTVF9JTkpFQ1RfRVJST1JfVFlQRQkweDEwCgpzdHJ1Y3QgdGVzdF9zdHJ1
Y3QgewoJaW50IHBpZDsKCXVuc2lnbmVkIGxvbmcJZ3Vlc3RfbWVtX3NpemU7Cgl1bnNpZ25lZCBs
b25nCWdwYTsKCXVuc2lnbmVkIGxvbmcJaHZhOwoJdW5zaWduZWQgbG9uZwlocGE7Cn07CgpzdGF0
aWMgdm9pZCB1c2FnZSh2b2lkKQp7CglmcHJpbnRmKHN0ZG91dCwgIlxuIik7CglmcHJpbnRmKHN0
ZG91dCwgIi4vdGVzdCA8Z3BhPlxuIik7CglmcHJpbnRmKHN0ZG91dCwgImdwYSAgVGhlIEdQQSAo
R3Vlc3QgUGh5c2ljYWwgQWRkcmVzcykgd2hlcmUgdGhlIGVycm9yIGlzIGluamVjdGVkXG4iKTsK
CWZwcmludGYoc3Rkb3V0LCAiXG4iKTsKfQoKc3RhdGljIHZvaWQgaW5pdF90ZXN0X3N0cnVjdChz
dHJ1Y3QgdGVzdF9zdHJ1Y3QgKnRlc3QpCnsKCXRlc3QtPnBpZAkJPSAtMTsKCXRlc3QtPmd1ZXN0
X21lbV9zaXplCT0gVEVTVF9HVUVTVF9NRU1fU0laRTsKCXRlc3QtPmdwYQkJPSAtMVVMOwoJdGVz
dC0+aHBhCQk9IC0xVUw7Cn0KCnN0YXRpYyBpbnQgZmV0Y2hfZ3BhKHN0cnVjdCB0ZXN0X3N0cnVj
dCAqdGVzdCwgaW50IGFyZ2MsIGNoYXIgKiphcmd2KQp7CglpZiAoYXJnYyAhPSAyKSB7CgkJdXNh
Z2UoKTsKCQlyZXR1cm4gLUVJTlZBTDsKCX0KCgl0ZXN0LT5ncGEgPSBzdHJ0b3VsKGFyZ3ZbMV0s
IE5VTEwsIDE2KTsKCWlmICh0ZXN0LT5ncGEgPCBURVNUX0dVRVNUX01FTV9TVEFSVCB8fAoJICAg
IHRlc3QtPmdwYSA+IChURVNUX0dVRVNUX01FTV9TVEFSVCArIHRlc3QtPmd1ZXN0X21lbV9zaXpl
KSkgewoJCWZwcmludGYoc3RkZXJyLCAiJXM6IEdQQSAweCVseCBvdXQgb2YgcmFuZ2UgWzFHQiwg
MUdCKzB4JWx4XVxuIiwKCQkJX19mdW5jX18sIHRlc3QtPmdwYSwgdGVzdC0+Z3Vlc3RfbWVtX3Np
emUpOwoJCXJldHVybiAtRUlOVkFMOwoJfQoKCXJldHVybiAwOwp9CgpzdGF0aWMgaW50IGZpbmRf
cWVtdV9waWQoc3RydWN0IHRlc3Rfc3RydWN0ICp0ZXN0KQp7CglESVIgKmRpcjsKCUZJTEUgKmZw
OwoJc3RydWN0IGRpcmVudCAqZW50cnk7CgljaGFyIHBhdGhbMjU2XSwgZGF0YVsyNTZdOwoJc2l6
ZV90IHN6OwoJaW50IHJldCA9IC1FTk9ERVY7CgoJZGlyID0gb3BlbmRpcigiL3Byb2MiKTsKCWlm
ICghZGlyKSB7CgkJZnByaW50ZihzdGRlcnIsICIlczogdW5hYmxlIHRvIG9wZW4gPC9wcm9jPlxu
IiwgX19mdW5jX18pOwoJCXJldHVybiAtRUlPOwoJfQoKCXdoaWxlICgoZW50cnkgPSByZWFkZGly
KGRpcikpICE9IE5VTEwpIHsKCQlpZiAoZW50cnktPmRfdHlwZSAhPSBEVF9ESVIgfHwgZW50cnkt
PmRfbmFtZVswXSA9PSAnLicpCgkJCWNvbnRpbnVlOwoKCQltZW1zZXQocGF0aCwgMCwgc2l6ZW9m
KHBhdGgpKTsKCQlzbnByaW50ZihwYXRoLCBzaXplb2YocGF0aCksICIvcHJvYy8lcy9jb21tIiwg
ZW50cnktPmRfbmFtZSk7CgkJZnAgPSBmb3BlbihwYXRoLCAiciIpOwoJCWlmICghZnApCgkJCWNv
bnRpbnVlOwoKCQltZW1zZXQoZGF0YSwgMCwgc2l6ZW9mKGRhdGEpKTsKCQlzeiA9IGZyZWFkKGRh
dGEsIDEsIHNpemVvZihkYXRhKSwgZnApOwoJCWZjbG9zZShmcCk7CgkJaWYgKHN6IDw9IDApCgkJ
CWNvbnRpbnVlOwoKCQlpZiAoc3Ryc3RyKGRhdGEsICJxZW11IikpIHsKCQkJcmV0ID0gMDsKCQkJ
dGVzdC0+cGlkID0gYXRvaShlbnRyeS0+ZF9uYW1lKTsKCQkJYnJlYWs7CgkJfQoJfQoKCWlmIChy
ZXQgIT0gMCkKCQlmcHJpbnRmKHN0ZGVyciwgIiVzOiBVbmFibGUgdG8gZmluZCBRRU1VIFBJRFxu
IiwgX19mdW5jX18pOwoKCWNsb3NlZGlyKGRpcik7CglyZXR1cm4gcmV0Owp9CgpzdGF0aWMgaW50
IGZldGNoX2h2YShzdHJ1Y3QgdGVzdF9zdHJ1Y3QgKnRlc3QpCnsKCUZJTEUgKmZwOwoJY2hhciBm
aWxlbmFtZVs2NF0sICpkYXRhID0gTlVMTCwgKm5leHQsICpuZXh0MTsKCXVuc2lnbmVkIGxvbmcg
c3RhcnQsIGVuZDsKCXNpemVfdCBzeiwgbGVuOwoJaW50IHJldCA9IC1FSU87CgoJbWVtc2V0KGZp
bGVuYW1lLCAwLCBzaXplb2YoZmlsZW5hbWUpKTsKCXNucHJpbnRmKGZpbGVuYW1lLCBzaXplb2Yo
ZmlsZW5hbWUpLCAiL3Byb2MvJWQvc21hcHMiLCB0ZXN0LT5waWQpOwoJZnAgPSBmb3BlbihmaWxl
bmFtZSwgInIiKTsKCWlmICghZnApIHsKCQlmcHJpbnRmKHN0ZGVyciwgIiVzOiBVbmFibGUgdG8g
b3BlbiA8JXM+XG4iLCBfX2Z1bmNfXywgZmlsZW5hbWUpOwoJCXJldHVybiByZXQ7Cgl9CgoJd2hp
bGUgKChzeiA9IGdldGxpbmUoJmRhdGEsICZsZW4sIGZwKSkgIT0gLTEpIHsKCQlpZiAoIXN0cnN0
cihkYXRhLCAicnctcCIpKQoJCQljb250aW51ZTsKCgkJbmV4dCA9IHN0cmNocihkYXRhLCAnLScp
OwoJCWlmICghbmV4dCkKCQkJY29udGludWU7CgoJCSpuZXh0KysgPSAnXDAnOwoJCW5leHQxID0g
c3RyY2hyKG5leHQsICcgJyk7CgkJaWYgKCFuZXh0MSkKCQkJY29udGludWU7CgoJCSpuZXh0MSA9
ICdcMCc7CgkJc3RhcnQgPSBzdHJ0b3VsKGRhdGEsIE5VTEwsIDE2KTsKCQllbmQgPSBzdHJ0b3Vs
KG5leHQsIE5VTEwsIDE2KTsKCQlpZiAoZW5kIC0gc3RhcnQgPT0gdGVzdC0+Z3Vlc3RfbWVtX3Np
emUpIHsKCQkJcmV0ID0gMDsKCQkJdGVzdC0+aHZhID0gc3RhcnQgKyAodGVzdC0+Z3BhIC0gVEVT
VF9HVUVTVF9NRU1fU1RBUlQpOwoJCQlicmVhazsKCQl9Cgl9CgoJaWYgKGRhdGEpCgkJZnJlZShk
YXRhKTsKCglmY2xvc2UoZnApOwoJcmV0dXJuIHJldDsKfQoKc3RhdGljIGludCBmZXRjaF9ocGEo
c3RydWN0IHRlc3Rfc3RydWN0ICp0ZXN0KQp7CglpbnQgZmQ7Cgl1bnNpZ25lZCBsb25nIHBpbmZv
LCBwZ3NpemUgPSBnZXRwYWdlc2l6ZSgpOwoJb2ZmX3Qgb2Zmc2V0ID0gKHRlc3QtPmh2YSAvIHBn
c2l6ZSkgKiBzaXplb2YocGluZm8pOwoJY2hhciBmaWxlbmFtZVsxMjhdOwoJc3NpemVfdCBzejsK
CgltZW1zZXQoZmlsZW5hbWUsIDAsIHNpemVvZihmaWxlbmFtZSkpOwoJc25wcmludGYoZmlsZW5h
bWUsIHNpemVvZihmaWxlbmFtZSksICIvcHJvYy8lZC9wYWdlbWFwIiwgdGVzdC0+cGlkKTsKCWZk
ID0gb3BlbihmaWxlbmFtZSwgT19SRE9OTFkpOwoJaWYgKGZkIDwgMCkgewoJCWZwcmludGYoc3Rk
ZXJyLCAiJXM6IFVuYWJsZSB0byBvcGVuIDwlcz5cbiIsIF9fZnVuY19fLCBmaWxlbmFtZSk7CgkJ
cmV0dXJuIC1FSU87Cgl9CgoJc3ogPSBwcmVhZChmZCwgJnBpbmZvLCBzaXplb2YocGluZm8pLCBv
ZmZzZXQpOwoJY2xvc2UoZmQpOwoJaWYgKHN6ICE9IHNpemVvZihwaW5mbykpIHsKCQlmcHJpbnRm
KHN0ZGVyciwgIiVzOiBVbmFibGUgdG8gcmVhZCBmcm9tIDwlcz5cbiIsIF9fZnVuY19fLCBmaWxl
bmFtZSk7CgkJcmV0dXJuIC1FSU87Cgl9CgoJaWYgKCEocGluZm8gJiAoMVVMIDw8IDYzKSkpIHsK
CQlmcHJpbnRmKHN0ZGVyciwgIiVzOiBQYWdlIG5vdCBwcmVzZW50XG4iLCBfX2Z1bmNfXyk7CgkJ
cmV0dXJuIC1FSU5WQUw7Cgl9CgoJdGVzdC0+aHBhID0gKChwaW5mbyAmIDB4MDA3ZmZmZmZmZmZm
ZmZmZlVMKSAqIHBnc2l6ZSkgKyAodGVzdC0+aHZhICYgKHBnc2l6ZSAtIDEpKTsKCXJldHVybiAw
Owp9CgpzdGF0aWMgaW50IHdyaXRlX2ZpbGUoY29uc3QgY2hhciAqZmlsZW5hbWUsIHVuc2lnbmVk
IGxvbmcgdmFsKQp7CglpbnQgZmQ7CgljaGFyIGRhdGFbMTI4XTsKCXNpemVfdCBzejsKCWludCBy
ZXQgPSAwOwoKCW1lbXNldChkYXRhLCAwLCBzaXplb2YoZGF0YSkpOwoJc3ogPSBzbnByaW50Zihk
YXRhLCBzaXplb2YoZGF0YSksICIweCVseCIsIHZhbCk7CgoJZmQgPSBvcGVuKGZpbGVuYW1lLCBP
X1dST05MWSk7CglpZiAoZmQgPCAwKSB7CgkJZnByaW50ZihzdGRlcnIsICIlczogVW5hYmxlIHRv
IG9wZW4gPCVzPlxuIiwgX19mdW5jX18sIGZpbGVuYW1lKTsKCQlyZXR1cm4gLUVJTzsKCX0KCglp
ZiAod3JpdGUoZmQsIGRhdGEsIHN6KSAhPSBzeikgewoJCXJldCA9IC1FSU87CgkJZnByaW50Zihz
dGRlcnIsICIlczogVW5hYmxlIHRvIHdyaXRlIDwlcz5cbiIsIF9fZnVuY19fLCBmaWxlbmFtZSk7
Cgl9CgoJY2xvc2UoZmQpOwoJcmV0dXJuIHJldDsKfQoKc3RhdGljIGludCBpbmplY3RfZXJyb3Io
c3RydWN0IHRlc3Rfc3RydWN0ICp0ZXN0KQp7CglmcHJpbnRmKHN0ZG91dCwgInBpZDoJJWRcbiIs
IHRlc3QtPnBpZCk7CglmcHJpbnRmKHN0ZG91dCwgImdwYToJMHglbHhcbiIsIHRlc3QtPmdwYSk7
CglmcHJpbnRmKHN0ZG91dCwgImh2YToJMHglbHhcbiIsIHRlc3QtPmh2YSk7CglmcHJpbnRmKHN0
ZG91dCwgImhwYToJMHglbHhcbiIsIHRlc3QtPmhwYSk7CgoJc3lzdGVtKCJtb2Rwcm9iZSBlaW5q
ID4gL2Rldi9udWxsIik7CglpZiAod3JpdGVfZmlsZSgiL3N5cy9rZXJuZWwvZGVidWcvYXBlaS9l
aW5qL3BhcmFtMSIsCQl0ZXN0LT5ocGEpIAkJfHwKCSAgICB3cml0ZV9maWxlKCIvc3lzL2tlcm5l
bC9kZWJ1Zy9hcGVpL2VpbmovcGFyYW0yIiwJCTB4ZmZmZmZmZmZmZmZmZjAwMCkJfHwKCSAgICB3
cml0ZV9maWxlKCIvc3lzL2tlcm5lbC9kZWJ1Zy9hcGVpL2VpbmovZmxhZ3MiLAkJMHgwKQkJCXx8
CgkgICAgd3JpdGVfZmlsZSgiL3N5cy9rZXJuZWwvZGVidWcvYXBlaS9laW5qL2Vycm9yX3R5cGUi
LAlURVNUX0lOSkVDVF9FUlJPUl9UWVBFKQl8fAoJICAgIHdyaXRlX2ZpbGUoIi9zeXMva2VybmVs
L2RlYnVnL2FwZWkvZWluai9ub3RyaWdnZXIiLAkJMSkJCQl8fAoJICAgIHdyaXRlX2ZpbGUoIi9z
eXMva2VybmVsL2RlYnVnL2FwZWkvZWluai9lcnJvcl9pbmplY3QiLAkxKSkKCQlyZXR1cm4gLUVJ
TzsKCglyZXR1cm4gMDsKfQoKaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQp7CglzdHJ1
Y3QgdGVzdF9zdHJ1Y3QgdGVzdDsKCWludCByZXQ7CgoJaW5pdF90ZXN0X3N0cnVjdCgmdGVzdCk7
CgoJaWYgKGZldGNoX2dwYSgmdGVzdCwgYXJnYywgYXJndikgfHwKCSAgICBmaW5kX3FlbXVfcGlk
KCZ0ZXN0KQkgfHwKCSAgICBmZXRjaF9odmEoJnRlc3QpCQkgfHwKCSAgICBmZXRjaF9ocGEoJnRl
c3QpCQkgfHwKCSAgICBpbmplY3RfZXJyb3IoJnRlc3QpKQoJCXJldHVybiAtRUlPOwoKCXJldHVy
biAwOwp9Cg==
--------------XUASwuusH8ii6etp0obdtpr5--



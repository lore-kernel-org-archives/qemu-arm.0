Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp757760ejc;
        Mon, 31 Oct 2022 00:35:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM66Pb7uo7pB6z9P+Rudf9xhAi38PbgkOGCctRu5DMXcpJHju6A7+0l5d3hYegPLZOBXpqKd
X-Received: by 2002:a37:f50b:0:b0:6fa:12f2:974c with SMTP id l11-20020a37f50b000000b006fa12f2974cmr7592300qkk.171.1667201758171;
        Mon, 31 Oct 2022 00:35:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667201758; cv=none;
        d=google.com; s=arc-20160816;
        b=B7FeAb3KorcP8nxLexhQlx+22q8PiPWeyF2Vgh50yADlrdyQHcJHJEeIGVh64tc7y/
         JiLympBS7Zf0Pc3T4v3yk5ucnfg3d8J0jt0lpdxE7EpfOIMDfbu71pDhbb6ZD425l2Gy
         rV7dp4Ub3p8peCzHtoqSAyGqOAMBaGh589qRPpqhj2qJkkY/XGQfgFWlR+WLofmRtwdt
         +ddTR9iCgL2D301bbrplA9LVNbJJpPAkebsLWML5F7UAE6SBGyuMy+U1kVkZkbbmfHNe
         ZOqP5LgoGf9IbJXS3862LfUCzA3k1Hhu/D/ZWXdUsGLq4ISpnbQ/sFNj7Nsdoh+Gc2Vv
         CFCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Qn2riQi4gF+U7yeuXOcxkq9pGaO3dpcrEOWJ05ZeHNI=;
        b=XOmtzmhaIOgcZyfl6WzZB4hjpbiGNA+0/LKyh3iuKAsA2wCOK7rQokzKQnNdIcqMW/
         w5TLcP7EpAhq3TzJGJw+H2jhaV7ijhv8bylj22qkf65Nq8nB+uHyUeEF4eHDHgiXZ57P
         waHp0BQY7ezLeNUDiW8Q4PWqaO9t1G5w5ft97uZ0w3p1SSz+rDxR6OU0JX3LnRR4f6IA
         ix6Y6sB/VdqSabFnrkIUae+pX9FmDEBemnvuVC2TOc4Qrw0GCfkHuXAI65PmiN9QYMQ2
         dtBTNXV8s/MIlaDeAR9eKys+gaNUgyI3JEx2/Qq61duTOUPSq7b4lfzCjUfVFqFrqAbw
         BGdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YKEyQ+BG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i13-20020a05620a150d00b006fa2e7dc051si1004900qkk.482.2022.10.31.00.35.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Oct 2022 00:35:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YKEyQ+BG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1opPKn-0004cY-9z; Mon, 31 Oct 2022 03:35:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1opPKl-0004cE-GA
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 03:35:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1opPKf-0005S3-Ph
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 03:35:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667201740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qn2riQi4gF+U7yeuXOcxkq9pGaO3dpcrEOWJ05ZeHNI=;
 b=YKEyQ+BGKyAKLnTJL5kqQpej6VARBUsQ42eHeltyCqq5DUiqXHbCU1FmUyl9nc9GnxPKac
 uo91Vs8AA9qF68SDK1Wc25qc2cL4eMUuiJM1mpsChRCOQb2CVwjGI7yrcEeG4FTbkhkq/Y
 oAvzOmcf+G1ex1cThfArjQtZa3/bnfQ=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-185-Jl4qaFZGOhyyD8fsClNf8Q-1; Mon, 31 Oct 2022 03:35:39 -0400
X-MC-Unique: Jl4qaFZGOhyyD8fsClNf8Q-1
Received: by mail-qk1-f197.google.com with SMTP id
 f12-20020a05620a408c00b006ced53b80e5so8867714qko.17
 for <qemu-arm@nongnu.org>; Mon, 31 Oct 2022 00:35:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Qn2riQi4gF+U7yeuXOcxkq9pGaO3dpcrEOWJ05ZeHNI=;
 b=2XR1GE6nYW5gg/PyR0Zfc5abRC+4VDXk6U2GScdThoeWv4D3UmoYJcRF1qXecJUI2k
 CCOtzuurWtUeOwQlE3XJRScVxghUDBwTnM4Q6s9LHYEpPkbmjFr7EOyvkNn/NpGBwB7P
 DMKie3bzplmyq3svxQsEkKrh0qunjkiLCB9hrz90iVuMxvKhRtKJpzdEqLsbchMM4Znb
 kYIZ0S6E/w+kDoG2Ee8hzXXhGxYYH23a2ns1zNq6nEzQuCGTeRrzomU2eBD2FVXq7Uwi
 I7Fpi7sxNrQz2BvhxjuV3cAJVSdRhASCaAHLZhmFQ9D9XAslu/8edTnP3q5USpNeuUFD
 +xDQ==
X-Gm-Message-State: ACrzQf2RbelUHhrmSNABKgro5SYu3kGSbCCDOkuwfEKETZJXQt48qKM+
 C9F2N54ebQrs1CxL+X+LoZgstKkrDS8ov6Xq73gaoYhLgrv1eVmSFPES3labJMZlclIVXN3f1b1
 EKZzjW7FObT0V
X-Received: by 2002:ac8:7d95:0:b0:39c:f1a5:7391 with SMTP id
 c21-20020ac87d95000000b0039cf1a57391mr9215771qtd.605.1667201738671; 
 Mon, 31 Oct 2022 00:35:38 -0700 (PDT)
X-Received: by 2002:ac8:7d95:0:b0:39c:f1a5:7391 with SMTP id
 c21-20020ac87d95000000b0039cf1a57391mr9215755qtd.605.1667201738382; 
 Mon, 31 Oct 2022 00:35:38 -0700 (PDT)
Received: from [192.168.8.104] (tmo-097-47.customers.d1-online.com.
 [80.187.97.47]) by smtp.gmail.com with ESMTPSA id
 q3-20020a05620a2a4300b006b640efe6dasm4184077qkp.132.2022.10.31.00.35.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 00:35:37 -0700 (PDT)
Message-ID: <ba75c126-68ae-5f63-d9c3-b1b4182df5b7@redhat.com>
Date: Mon, 31 Oct 2022 08:35:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2] Fix some typos in documentation and comments
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Michael Roth
 <michael.roth@amd.com>, Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>, qemu-arm@nongnu.org, virtio-fs@redhat.com,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20221030105944.311940-1-sw@weilnetz.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221030105944.311940-1-sw@weilnetz.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.055,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8pa2Fkj4zpWt

On 30/10/2022 11.59, Stefan Weil wrote:
> Most of them were found and fixed using codespell.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> 
> v2: Fixes from Peter Maydell's comments
> 
> My focus was fixing typos which are relevant for the generated documentation.
> 
> codespell finds many more typos in source code, and adding it to the continuous
> integration checks looks more and more like a good idea.

... at least for the docs/ folder, this might indeed be a good idea.

Reviewed-by: Thomas Huth <thuth@redhat.com>



> 
> 
>   docs/devel/testing.rst              |  2 +-
>   docs/system/arm/cpu-features.rst    |  2 +-
>   docs/system/loongarch/loongson3.rst |  2 +-
>   docs/tools/virtiofsd.rst            |  2 +-
>   include/exec/memory.h               |  2 +-
>   qapi/qom.json                       |  2 +-
>   qemu-options.hx                     | 10 +++++-----
>   qga/qapi-schema.json                |  2 +-
>   tests/qtest/libqtest.h              |  2 +-
>   9 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
> index fbb98faabe..e10c47b5a7 100644
> --- a/docs/devel/testing.rst
> +++ b/docs/devel/testing.rst
> @@ -99,7 +99,7 @@ successfully on various hosts. The following list shows some best practices:
>   * If your test cases uses the blkdebug feature, use relative path to pass
>     the config and image file paths in the command line as Windows absolute
>     path contains the delimiter ":" which will confuse the blkdebug parser.
> -* Use double quotes in your extra QEMU commmand line in your test cases
> +* Use double quotes in your extra QEMU command line in your test cases
>     instead of single quotes, as Windows does not drop single quotes when
>     passing the command line to QEMU.
>   * Windows opens a file in text mode by default, while a POSIX compliant
> diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
> index c2c01ec7d2..00c444042f 100644
> --- a/docs/system/arm/cpu-features.rst
> +++ b/docs/system/arm/cpu-features.rst
> @@ -433,7 +433,7 @@ additional constraints on the set of vector lengths supported by SME.
>   SME User-mode Default Vector Length Property
>   --------------------------------------------
>   
> -For qemu-aarch64, the cpu propery ``sme-default-vector-length=N`` is
> +For qemu-aarch64, the cpu property ``sme-default-vector-length=N`` is
>   defined to mirror the Linux kernel parameter file
>   ``/proc/sys/abi/sme_default_vector_length``.  The default length, ``N``,
>   is in units of bytes and must be between 16 and 8192.
> diff --git a/docs/system/loongarch/loongson3.rst b/docs/system/loongarch/loongson3.rst
> index 1bdab44e27..68113b6f5e 100644
> --- a/docs/system/loongarch/loongson3.rst
> +++ b/docs/system/loongarch/loongson3.rst
> @@ -41,7 +41,7 @@ can be accessed by following steps.
>   
>     $ qemu-system-loongarch64 -machine virt -m 4G -cpu la464-loongarch-cpu \
>         -smp 1 -bios QEMU_EFI.fd -kernel vmlinuz.efi -initrd initrd.img \
> -      -append "root=/dev/ram rdinit=/sbin/init consol e=ttyS0,115200" \
> +      -append "root=/dev/ram rdinit=/sbin/init console=ttyS0,115200" \
>         --nographic
>   
>   Note: The running speed may be a little slow, as the performance of our
> diff --git a/docs/tools/virtiofsd.rst b/docs/tools/virtiofsd.rst
> index 5f5ac9dd56..995a754a7b 100644
> --- a/docs/tools/virtiofsd.rst
> +++ b/docs/tools/virtiofsd.rst
> @@ -232,7 +232,7 @@ e.g.:
>   
>     ``:ok:server::security.:``
>   
> -  will pass 'securty.' xattr's in listxattr from the server
> +  will pass 'security.' xattr's in listxattr from the server
>     and ignore following rules.
>   
>     ``:ok:all:::``
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index bfb1de8eea..a751c111bd 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -1970,7 +1970,7 @@ void memory_region_clear_dirty_bitmap(MemoryRegion *mr, hwaddr start,
>    * querying the same page multiple times, which is especially useful for
>    * display updates where the scanlines often are not page aligned.
>    *
> - * The dirty bitmap region which gets copyed into the snapshot (and
> + * The dirty bitmap region which gets copied into the snapshot (and
>    * cleared afterwards) can be larger than requested.  The boundaries
>    * are rounded up/down so complete bitmap longs (covering 64 pages on
>    * 64bit hosts) can be copied over into the bitmap snapshot.  Which
> diff --git a/qapi/qom.json b/qapi/qom.json
> index 80dd419b39..216b56a4e6 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -586,7 +586,7 @@
>   #
>   # @size: size of the memory region in bytes
>   #
> -# @x-use-canonical-path-for-ramblock-id: if true, the canoncial path is used
> +# @x-use-canonical-path-for-ramblock-id: if true, the canonical path is used
>   #                                        for ramblock-id. Disable this for 4.0
>   #                                        machine types or older to allow
>   #                                        migration with newer QEMU versions.
> diff --git a/qemu-options.hx b/qemu-options.hx
> index eb38e5dc40..1141dc5e58 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1051,7 +1051,7 @@ SRST
>       details on the external interface.
>   
>   ``-device isa-ipmi-kcs,bmc=id[,ioport=val][,irq=val]``
> -    Add a KCS IPMI interafce on the ISA bus. This also adds a
> +    Add a KCS IPMI interface on the ISA bus. This also adds a
>       corresponding ACPI and SMBIOS entries, if appropriate.
>   
>       ``bmc=id``
> @@ -1071,7 +1071,7 @@ SRST
>       is 0xe4 and the default interrupt is 5.
>   
>   ``-device pci-ipmi-kcs,bmc=id``
> -    Add a KCS IPMI interafce on the PCI bus.
> +    Add a KCS IPMI interface on the PCI bus.
>   
>       ``bmc=id``
>           The BMC to connect to, one of ipmi-bmc-sim or ipmi-bmc-extern above.
> @@ -5248,8 +5248,8 @@ SRST
>           read the colo-compare git log.
>   
>       ``-object cryptodev-backend-builtin,id=id[,queues=queues]``
> -        Creates a cryptodev backend which executes crypto opreation from
> -        the QEMU cipher APIS. The id parameter is a unique ID that will
> +        Creates a cryptodev backend which executes crypto operations from
> +        the QEMU cipher APIs. The id parameter is a unique ID that will
>           be used to reference this cryptodev backend from the
>           ``virtio-crypto`` device. The queues parameter is optional,
>           which specify the queue number of cryptodev backend, the default
> @@ -5516,7 +5516,7 @@ SRST
>                          file=/etc/qemu/vnc.allow
>   
>           Finally the ``/etc/qemu/vnc.allow`` file would contain the list
> -        of x509 distingished names that are permitted access
> +        of x509 distinguished names that are permitted access
>   
>           ::
>   
> diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
> index 026a56f76c..796434ed34 100644
> --- a/qga/qapi-schema.json
> +++ b/qga/qapi-schema.json
> @@ -392,7 +392,7 @@
>   ##
>   # @guest-file-flush:
>   #
> -# Write file changes bufferred in userspace to disk/kernel buffers
> +# Write file changes buffered in userspace to disk/kernel buffers
>   #
>   # @handle: filehandle returned by guest-file-open
>   #
> diff --git a/tests/qtest/libqtest.h b/tests/qtest/libqtest.h
> index 65c040e504..1a76bae326 100644
> --- a/tests/qtest/libqtest.h
> +++ b/tests/qtest/libqtest.h
> @@ -727,7 +727,7 @@ bool qtest_has_device(const char *device);
>    * qtest_qmp_device_add_qdict:
>    * @qts: QTestState instance to operate on
>    * @drv: Name of the device that should be added
> - * @arguments: QDict with properties for the device to intialize
> + * @arguments: QDict with properties for the device to initialize
>    *
>    * Generic hot-plugging test via the device_add QMP command with properties
>    * supplied in form of QDict. Use NULL for empty properties list.


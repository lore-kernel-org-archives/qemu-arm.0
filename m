Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp6535081njd;
        Mon, 7 Apr 2025 10:31:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXK4tLEtwpqG2ZuM3dBuS4cv2xiA4pXW7eHOz9kUxl5yBdYk2ygr2dEfx8ak68CcFH81sUPDTMwAM/xCQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE3qIfZhX/iv/qwb6wEzhDJJRjTjmTT6LxXKmQrWEkJ5UjnUqtSJfcMrh6o6pzB5XYbuUg5
X-Received: by 2002:a05:620a:319d:b0:7c5:94b2:99da with SMTP id af79cd13be357-7c774d6fc7cmr1827957585a.28.1744047087918;
        Mon, 07 Apr 2025 10:31:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744047087; cv=none;
        d=google.com; s=arc-20240605;
        b=j2w3ca5yJ0k7awdfxWwBDXI4ekOu5YY3owMUxkilT8h1XSDH3JLr9X/qApfoPcickG
         RGXdgP0Q2O5Bhc/Eqm2xynq7wwzDP/a+s1HBgHYIkZ2VCtscGHTuaAlxP7MXg5NNF0BS
         zJUdaoWOGRPAXdkCpmTXL+f3UpLcHijYpGjK9WPIFHtumtx5sG2XcLgGygxVJJ/vFNeY
         Az/hq1v+u+CGmG32ciBmgGkGghEclYZTWo5mTigk46HtzRQ1NQjAfUkEevwoYwF/NgjJ
         tuCpR2ZJuayGfrRv5mIQCCEPnvn03FYjhX4l4vM3I0XnmtqYwwp3AFDC+1e/iLaxBLML
         2cKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=VfoVmOBD5xgr+eXJQDG+Yi3XuSvAykSDMs2Nslin8KM=;
        fh=FSBec69jBiSzeA96y2qg8uO8/aoGgdMbarBWg7vfsqU=;
        b=AtRqWA0mGGMppZGYEfqg0gYYueWEbuYasTRxZuTVaa0hKSjL12b/ePHQn0Othcgbxe
         aOHzsfw+CcUF0vBTUogwrWgvO4iTPPrERD3YZspcKK5O/s08TEf9tFxZZpp0bGnGjdg5
         NK2bW94AaPACJl3W79kfifqkBX0UhSxXPA2X+YhmuVBjzpbHoVRehYB3qPR6gDqNUyEj
         zMKGEEMl8b64sMnexSt+2iWPoS54aHJ0K+PIvhBst4GDpBkdp9GHXO75PtVqQmsEUIg1
         avb07KTO+t0zclZmq2xawCCMkw5smUBgRyJRfb/HKOiw6FHTZQjSRNmrL4tIMchgCdzv
         TVFQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fyPPXnuk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c76ea90599si928078385a.398.2025.04.07.10.31.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Apr 2025 10:31:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fyPPXnuk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u1qJS-0005bS-8l; Mon, 07 Apr 2025 13:31:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1u1qJH-0005Yv-Qo
 for qemu-arm@nongnu.org; Mon, 07 Apr 2025 13:31:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1u1qJG-0000AU-2G
 for qemu-arm@nongnu.org; Mon, 07 Apr 2025 13:30:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744047056;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VfoVmOBD5xgr+eXJQDG+Yi3XuSvAykSDMs2Nslin8KM=;
 b=fyPPXnukbW+iC/WFpjzi3/zZLN/Tfy9vg4k1NPLxQ+VTXD0geC5BjUr7zSUuBXEsYr8mFu
 aEX8xFoL1tr8ETZbVJ5+WOmdB32J9wTY4KKIOhR/3ZTStXzguaoa/9rgo7D8Hrs+hcu3vc
 QuvxOLDlkvxUH/kZ8R15AdhHsJackDs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-nP3qeEpsPOy4B953qODxWA-1; Mon, 07 Apr 2025 13:30:51 -0400
X-MC-Unique: nP3qeEpsPOy4B953qODxWA-1
X-Mimecast-MFC-AGG-ID: nP3qeEpsPOy4B953qODxWA_1744047051
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3914bc0cc4aso2407367f8f.3
 for <qemu-arm@nongnu.org>; Mon, 07 Apr 2025 10:30:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744047050; x=1744651850;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VfoVmOBD5xgr+eXJQDG+Yi3XuSvAykSDMs2Nslin8KM=;
 b=nrU73FnHAgCpPd5lWYbQrla2f2WOMRoNn4TyP+JgWWd2iiq7k3AG6jcgURlRD9pyZL
 0za40XuJ7hrSdclVSkdlcnO2Mhf9nlBmYsjCU/lFCcCsH20USl0SaclE5q1ShVdOo6lH
 7iB1tHfo6edszemj7THr7MdUACwiLnwa3dpqVek5ZZ07ieQPOBjKasAbf9XsJ2eM6kP9
 2GKbzt4HsBK9MQYCsttKQxfHUofWUzbrlqnhrlvazfDiIH8BXDvRt0mWsmw0XlO7OlOA
 d8TQFh8Dt4uZnXYjy6UWunk00pWf2OvMWNDlsbYjGbOweUAD0GY18Ap29EHYXh35otay
 /Eeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzyCt6qpbtD5HgGTf8CeodsRcm0bhC6fMIPe15UixfqPIIKMCt2FfdteN1RR4M179xkY0IViQdKw==@nongnu.org
X-Gm-Message-State: AOJu0YxrSzP/OMdtMbKhJR8crC6u6ow+2ZFTyzCghVjPH483e18B1wth
 pr6YBU+YjvDsA7zoqaqJFh0b4YF/UKpb2YVjzdubuJ876yaclr7mcTlhKi8PCBz+HjkLGdlfqW2
 JOTdCpQDcoFBsFEjM4cgTqS47tBJrox/fcfGtXQAk9Obc942wsg==
X-Gm-Gg: ASbGncutbcuHPOESP9DnXQOdAlCa7kP4hauSRdBGyq+dyKSNJHQLvuCntys5qRSUciS
 RtS6nr3XqPHginNNM5hWcxDOm+cGi3dgTFqXhG9p16xmqP49TryJcr3IEbu4+0ZRMNs5+BBW3Br
 QANIH7hl0TgM+QdkGeGrQodl5l5+kw3x537z6ifyWrjXayYDAYzGKnXRoN0F2myjcqfdOFjV1VF
 RHpnb50qN//nAstluU1kbpyC/Vkp5nCpnr9WM2cVhkmAKRGxvh/lDO3a0vqKr3Rllx0M98IzsXB
 5xCZpjORsfvGPUuqFhh3ZdGH0+rSys9Ugdbdynm81nfQIRxoIe/LlITz5b2gGFA=
X-Received: by 2002:a05:6000:2486:b0:390:f699:8c27 with SMTP id
 ffacd0b85a97d-39d07ad5183mr9959119f8f.12.1744047050538; 
 Mon, 07 Apr 2025 10:30:50 -0700 (PDT)
X-Received: by 2002:a05:6000:2486:b0:390:f699:8c27 with SMTP id
 ffacd0b85a97d-39d07ad5183mr9959082f8f.12.1744047050147; 
 Mon, 07 Apr 2025 10:30:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d7c6d838bsm2555024f8f.69.2025.04.07.10.30.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Apr 2025 10:30:49 -0700 (PDT)
Message-ID: <03409a9d-fbee-4e08-9ca3-861bf8eddd55@redhat.com>
Date: Mon, 7 Apr 2025 19:30:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/6] tests/qtest/bios-table-test: testing new ARM ACPI
 PPTT topology
To: Alireza Sanaee <alireza.sanaee@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: mst@redhat.com, zhao1.liu@intel.com, dapeng1.mi@linux.intel.com,
 armbru@redhat.com, farman@linux.ibm.com, peter.maydell@linaro.org,
 anisinha@redhat.com, shannon.zhaosl@gmail.com, imammedo@redhat.com,
 mtosatti@redhat.com, berrange@redhat.com, richard.henderson@linaro.org,
 shameerali.kolothum.thodi@huawei.com, jonathan.cameron@huawei.com,
 jiangkunkun@huawei.com, yangyicong@hisilicon.com, linuxarm@huawei.com
References: <20250310162337.844-1-alireza.sanaee@huawei.com>
 <20250310162337.844-6-alireza.sanaee@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250310162337.844-6-alireza.sanaee@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0cx9PZL4C15YvJxs7lo63DdBQIQn5B-mBl8qqQtMzF8_1744047051
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.32,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: REyJVy//DmzR

Hi,

On 3/10/25 5:23 PM, Alireza Sanaee via wrote:
> Test new PPTT topolopy with cache representation.
>
> Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  tests/qtest/bios-tables-test.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index 0a333ec43536..6bdc25f4df1e 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -2142,6 +2142,10 @@ static void test_acpi_aarch64_virt_tcg_topology(void)
>      };
>  
>      test_acpi_one("-cpu cortex-a57 "
> +                  "-M virt,smp-cache.0.cache=l1i,smp-cache.0.topology=cluster,"
> +                  "smp-cache.1.cache=l1d,smp-cache.1.topology=cluster,"
> +                  "smp-cache.2.cache=l2,smp-cache.2.topology=cluster,"
> +                  "smp-cache.3.cache=l3,smp-cache.3.topology=cluster "
In the coverletter you used different topologies: core, cluster, socket.
Don't you want to test the same config here?

Is it better to reuse the existing ".topology" variant or to create
another one? (I have no strong opinion though)

Thanks

Eric
>                    "-smp sockets=1,clusters=2,cores=2,threads=2", &data);
>      free_test_data(&data);
>  }


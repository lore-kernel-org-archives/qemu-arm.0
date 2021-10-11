Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp812215lfc;
        Mon, 11 Oct 2021 07:41:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyx/p1bWd5Z4otiEl501tt2zplnAJIKoM0hZC8Xp3Rs8rt1a0SAFvMrUNai4MNeP93PFGaQ
X-Received: by 2002:a05:620a:532:: with SMTP id h18mr7235575qkh.132.1633963265831;
        Mon, 11 Oct 2021 07:41:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633963265; cv=none;
        d=google.com; s=arc-20160816;
        b=mA6+++Q9+gX2K+E/bRC2s05bbVKhP3fPNfWEzXVkzHzf8bqI89w+PjkYLtnJlzGqRZ
         LoNZZTCyleqJjRyp0bZndNRRPgw/RBRokx7GkcNY6yPUqCQjONCrJA+/OWax0P1Ivwbv
         LJ+w0fssKmJqCJwWKCSYREBn16yrkEu7euc+ywIWoYD1j1WhkipJtt3Rt9XIQxiES9Uo
         2ADeGImeqh9+1h3vBnPeya3e9s1XnTOSW/DKfzxiDDDScpMAs3GZ5L9xgxo8SIA02FS9
         VaKTkpJOfIXOlFie7THyEeyjkz+myGQNEYETCCnsv7f9fhlNX6+MvHCmKaa6/yDlSu02
         IHyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=H/cG52eUfC2yHg7ry4MRG9pUHfjEckgwLM5wHmFfLbg=;
        b=jyhKCXnPCvYzl7yYbSZ7UPZSPmpfzj8ROuGGE9C20DePSZTy5t4JcE/fovx7l2PGCq
         AiFycMVeQtL8Gi7LCc5f8vxn5LrVBNCE4ehqrPiQaPxKtQwPLg3BxfGs5RbvOPgJPxhT
         GRK3HMjHw7XDjlLSaf//CkXAcEE6b8JC+OWjhzWOF6lJXBeRmDz7wVSUkEvS7zQDim93
         c7O+gI3n2n/jDPOsGSXe4HlQxO+L6xiGrgIxCojNZNOC6ZXRmYoUz93agPY4SdpaWf6c
         dC4qW4WTVyGaThd5d2NjjolEH8vtYfpwIM/XXYywED9QQ6z7UhsrfvQNFowUXRn0b96/
         el6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NyjjXfKZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a13si5349319qta.173.2021.10.11.07.41.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Oct 2021 07:41:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NyjjXfKZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mZwUD-0005FB-9X
	for alex.bennee@linaro.org; Mon, 11 Oct 2021 10:41:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mZwTm-0005DK-C3
 for qemu-arm@nongnu.org; Mon, 11 Oct 2021 10:40:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mZwTk-0003Ge-Hd
 for qemu-arm@nongnu.org; Mon, 11 Oct 2021 10:40:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633963235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H/cG52eUfC2yHg7ry4MRG9pUHfjEckgwLM5wHmFfLbg=;
 b=NyjjXfKZbWZWUwv/nNjpH5teaQhjxy8zxeDE1ly+DHQW84Z9gMkzkdrvZQCu8ljXFfTroF
 htKlzGJ9Fes4lEHMMKBnZVFlRkC0BPa9KpolJPB3BLM26hELYHZOaP8I4TlqFHv1n0sjyE
 ejVAAdzzt3OrTV7TPaffwzSYUECC9wM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-7NuGglBxO6SxLhBRvYVrhw-1; Mon, 11 Oct 2021 10:40:33 -0400
X-MC-Unique: 7NuGglBxO6SxLhBRvYVrhw-1
Received: by mail-ed1-f71.google.com with SMTP id
 z23-20020aa7cf97000000b003db7be405e1so5195035edx.13
 for <qemu-arm@nongnu.org>; Mon, 11 Oct 2021 07:40:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H/cG52eUfC2yHg7ry4MRG9pUHfjEckgwLM5wHmFfLbg=;
 b=EKINznjxTS4DrFSCgirsUuuZBl6rNBM5Bkh48P2NiaHFaQe1w+qomhAYnk7dNgi2bP
 OTrfq9YbcSO+55SN6oM4HgPeeeO4kcrRW2wnC91GWMRwjWQSqmreVND74FoeoC42pCRI
 DmCut1RVhusVLUNCtZB5j7kmmyMiEUNyMPlmhEy3Rr+sZdzXmMnpEi2aHxi2vdNTC6Pg
 epSzd0h33qOPFh4fMX+298ywB565ZugP/CTfX+Gcvjfb1TLAUCYikl/IdIH5bjkK/zyi
 oaUHynEkZbBjWCai7YH893w6jXrGZ9zuvrzo8gXD3mfAgHEvt6SqxXGrE5zIgaTZbkoC
 1eDQ==
X-Gm-Message-State: AOAM532L8TaSgIloZvQgyZFdm+2fpQmoFVlQ+hank2E2Fa6lgwsfpWIh
 zdTymffK2lzsU1rk1IAmxCBeZkVVr3vWGcpROax3yT37obkjqJm2S+Lh4OQ9RDg3molDjOucXng
 96Tu24fIKe/uH
X-Received: by 2002:a17:906:38ce:: with SMTP id
 r14mr25429592ejd.268.1633963232801; 
 Mon, 11 Oct 2021 07:40:32 -0700 (PDT)
X-Received: by 2002:a17:906:38ce:: with SMTP id
 r14mr25429561ejd.268.1633963232605; 
 Mon, 11 Oct 2021 07:40:32 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id lb12sm3709190ejc.28.2021.10.11.07.40.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 07:40:32 -0700 (PDT)
Date: Mon, 11 Oct 2021 16:40:31 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2 3/3] tests/acpi: Generate reference blob for IORT rev
 E.b
Message-ID: <20211011164031.0db6bdce@redhat.com>
In-Reply-To: <20211005083805.493456-4-eric.auger@redhat.com>
References: <20211005083805.493456-1-eric.auger@redhat.com>
 <20211005083805.493456-4-eric.auger@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, gshan@redhat.com,
 qemu-devel@nongnu.org, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 philmd@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1iP8raA6Bm7R

On Tue,  5 Oct 2021 10:38:05 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Re-generate reference blobs with rebuild-expected-aml.sh.

commit message should have diff old vs new,
if dis is the same/similar for various variants,
it's fine to provide only one variant  diff here.

> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  tests/qtest/bios-tables-test-allowed-diff.h |   1 -
>  tests/data/acpi/virt/IORT                   | Bin 124 -> 128 bytes
>  tests/data/acpi/virt/IORT.memhp             | Bin 124 -> 128 bytes
>  tests/data/acpi/virt/IORT.numamem           | Bin 124 -> 128 bytes
>  tests/data/acpi/virt/IORT.pxb               | Bin 124 -> 128 bytes
>  5 files changed, 1 deletion(-)
> 
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index 9a5a923d6b..dfb8523c8b 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1,2 +1 @@
>  /* List of comma-separated changed AML files to ignore */
> -"tests/data/acpi/virt/IORT",
> diff --git a/tests/data/acpi/virt/IORT b/tests/data/acpi/virt/IORT
> index 521acefe9ba66706c5607321a82d330586f3f280..7efd0ce8a6b3928efa7e1373f688ab4c5f50543b 100644
> GIT binary patch
> literal 128
> zcmebD4+?2uU|?Y0?Bwt45v<@85#X!<1dKp25F11@0kHuPgMkDCNC*yK93~3}W)K^M
> VRiHGGVg_O`aDdYP|3ers^8jQz3IPBB
> 
> literal 124
> zcmebD4+^Pa00MR=e`k+i1*eDrX9XZ&1PX!JAesq?4S*O7Bw!2(4Uz`|CKCt^;wu0#
> QRGb+i3L*dhhtM#y0PN=p0RR91
> 
> diff --git a/tests/data/acpi/virt/IORT.memhp b/tests/data/acpi/virt/IORT.memhp
> index 521acefe9ba66706c5607321a82d330586f3f280..7efd0ce8a6b3928efa7e1373f688ab4c5f50543b 100644
> GIT binary patch
> literal 128
> zcmebD4+?2uU|?Y0?Bwt45v<@85#X!<1dKp25F11@0kHuPgMkDCNC*yK93~3}W)K^M
> VRiHGGVg_O`aDdYP|3ers^8jQz3IPBB
> 
> literal 124
> zcmebD4+^Pa00MR=e`k+i1*eDrX9XZ&1PX!JAesq?4S*O7Bw!2(4Uz`|CKCt^;wu0#
> QRGb+i3L*dhhtM#y0PN=p0RR91
> 
> diff --git a/tests/data/acpi/virt/IORT.numamem b/tests/data/acpi/virt/IORT.numamem
> index 521acefe9ba66706c5607321a82d330586f3f280..7efd0ce8a6b3928efa7e1373f688ab4c5f50543b 100644
> GIT binary patch
> literal 128
> zcmebD4+?2uU|?Y0?Bwt45v<@85#X!<1dKp25F11@0kHuPgMkDCNC*yK93~3}W)K^M
> VRiHGGVg_O`aDdYP|3ers^8jQz3IPBB
> 
> literal 124
> zcmebD4+^Pa00MR=e`k+i1*eDrX9XZ&1PX!JAesq?4S*O7Bw!2(4Uz`|CKCt^;wu0#
> QRGb+i3L*dhhtM#y0PN=p0RR91
> 
> diff --git a/tests/data/acpi/virt/IORT.pxb b/tests/data/acpi/virt/IORT.pxb
> index 521acefe9ba66706c5607321a82d330586f3f280..7efd0ce8a6b3928efa7e1373f688ab4c5f50543b 100644
> GIT binary patch
> literal 128
> zcmebD4+?2uU|?Y0?Bwt45v<@85#X!<1dKp25F11@0kHuPgMkDCNC*yK93~3}W)K^M
> VRiHGGVg_O`aDdYP|3ers^8jQz3IPBB
> 
> literal 124
> zcmebD4+^Pa00MR=e`k+i1*eDrX9XZ&1PX!JAesq?4S*O7Bw!2(4Uz`|CKCt^;wu0#
> QRGb+i3L*dhhtM#y0PN=p0RR91
> 


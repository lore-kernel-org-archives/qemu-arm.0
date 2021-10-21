Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp90122lfc;
        Thu, 21 Oct 2021 02:03:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyngD06lGDUy32QTgmL9iv2Ey6YpdylCKGz18FUE50uSakW44JYs8ZLJRkk4zgyfwnUVgNb
X-Received: by 2002:a05:6122:2224:: with SMTP id bb36mr3875675vkb.23.1634807020463;
        Thu, 21 Oct 2021 02:03:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634807020; cv=none;
        d=google.com; s=arc-20160816;
        b=S/mpZttDAEGQCtlOPas4qD5wyYn2rRa9OQX6Q7fGIPPpOOcyhV/GyzQO7P1x8kbOoV
         FrIZbWC9fGXV+b8jLGBjmrGgL8BLCji86+gVE6todR/LuRNIiTN5yaUMUj08R9w5Esbn
         HPwQGzUmT0+6HqPfFlpoFy0l8cc3JWlleSRYJx0ReM8tC+UTSdxAVuE7BKbCBh3ADZVA
         9FJx0a7QOEVEG9Imge+kZxmwdxKv+ho1JUQEb/Kx7aGH0qBwAB3y1icMg0Ivv7BKKphy
         wOr3g/eRoW3Ng8Pt9ur61CG/yRyXUWDp4Lu2WBBq5FPbzgCWx4h+pAyaYB9G1pFrkmZN
         VbIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=T7FhM9xguN3GyO5JfwlChbSE9NYxzYwDFNmKMn07tqo=;
        b=iJCz9jBGQlemSeK6WzysPlktPAtmmw1ICoxy4Udu3pw/0vZ3HdZwGMok/4OPSWY8gw
         hXidNuzSgz4yXgost0BlUHBozfONk9pvGk9k1irqvZ2xCk+kKkWPmMlcXxRee8iTfv7O
         KzyG8TxAj5IYjOO3T3sctuL0k+3PyXBHIGYqA1fIi1fzKP4gyYfG4ACG8bWmZRot8hYJ
         mNWohARfLMQcu+yDjFF6cx/K1a/X8b/SZwUjUOBB+akEPFK3HD4ZP2lO5PC2L1Zzg/05
         A9JCCUPG6ymHw1Sgjn9bKf5ysCTzdJI15LSh0Q3myIc4FDhRaCfGfnbAV9Li4fKPbdG7
         Dk7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ImTtB1xA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s15si1710460vsh.15.2021.10.21.02.03.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Oct 2021 02:03:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ImTtB1xA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mdTz9-0007Eh-Ks
	for alex.bennee@linaro.org; Thu, 21 Oct 2021 05:03:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mdTyA-0007DF-Fd
 for qemu-arm@nongnu.org; Thu, 21 Oct 2021 05:02:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mdTy8-00061n-Uu
 for qemu-arm@nongnu.org; Thu, 21 Oct 2021 05:02:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634806955;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T7FhM9xguN3GyO5JfwlChbSE9NYxzYwDFNmKMn07tqo=;
 b=ImTtB1xAYGtWzUKtZaa5m+E2gQZnnAhBXFxhgzHR2WhC2Qd9BrFn1+hiaVIolikeoRY4sZ
 dn5sAHx8EiLKCTfS503DXRuDPPu72KXMZBA3jVrGXLYwtd/63wW+UBm25giKLJFxTnoyFX
 FET6kV7UHzWzmuwN31guzXiYxSUfjks=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-TJCAPp2gNaSeMmkcAz00qw-1; Thu, 21 Oct 2021 05:02:34 -0400
X-MC-Unique: TJCAPp2gNaSeMmkcAz00qw-1
Received: by mail-wm1-f72.google.com with SMTP id
 g63-20020a1c2042000000b003231f6cebb8so244924wmg.3
 for <qemu-arm@nongnu.org>; Thu, 21 Oct 2021 02:02:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=T7FhM9xguN3GyO5JfwlChbSE9NYxzYwDFNmKMn07tqo=;
 b=m8YdIL2nALyerBDtBwvilRVM7L6CjerU/yR2xbTjtWUYWNCe2e+jYzRhjIlKq3BjLf
 nvqOKkTEUYg+B1oOiyj5A2ctAHxYs/7vyZLBwQ4pQq3fMUuB4DDrpbsivhfmvAE4v4we
 GGuztTG1tFgZULBop0LG4THTc19cZdXagc0LrkCJHGLkzC6k1pD+K8HXkY2a38t/eb4Y
 B+mMrGZuvpDlTtjhSWqkOmZxe5kl0rxy/iq4LTGvYP56m9tYQo5RjSpS2cboejHD+UD2
 GoPv309VkIf1OuYM5isBydA/BpRVMFKxqO0bKTNwipqGWKp2vCPGxTtt3SrL+CQKDs+K
 RX7Q==
X-Gm-Message-State: AOAM531uRCHuuQNeAfLRm1YrHon6XCTMtS2+O2pl0zQ9bsFR6SLeYmIF
 Vx3zdstgeeidh15i84/XKT2BBUYLoDsHy0A2VJzHp62PhlkssfJlwbDCePUgk6rx2luJsQPIUvu
 2Ox5T11skmrNSJZXLJRouUxIX0GbuqMre1yMu9LF1YqDVZnCQhm4Oj9egOJrcvr95I6o=
X-Received: by 2002:a5d:60c6:: with SMTP id x6mr5725454wrt.28.1634806952741;
 Thu, 21 Oct 2021 02:02:32 -0700 (PDT)
X-Received: by 2002:a5d:60c6:: with SMTP id x6mr5725414wrt.28.1634806952433;
 Thu, 21 Oct 2021 02:02:32 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id n66sm4342696wmn.2.2021.10.21.02.02.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 02:02:31 -0700 (PDT)
Subject: Re: [PATCH v5 09/12] tests/acpi: allow updates of VIOT expected data
 files
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, mst@redhat.com,
 imammedo@redhat.com, peter.maydell@linaro.org
References: <20211020172745.620101-1-jean-philippe@linaro.org>
 <20211020172745.620101-10-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <33fc93b5-bd0a-4ef2-7b87-641b252c4e42@redhat.com>
Date: Thu, 21 Oct 2021 11:02:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211020172745.620101-10-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.267, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Cc: ehabkost@redhat.com, jasowang@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, peterx@redhat.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com, ani@anisinha.ca,
 pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KeSYJfoVq5uk



On 10/20/21 7:27 PM, Jean-Philippe Brucker wrote:
> Create empty data files and allow updates for the upcoming VIOT tests.
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 3 +++
>  tests/data/acpi/q35/DSDT.viot               | 0
>  tests/data/acpi/q35/VIOT.viot               | 0
>  tests/data/acpi/virt/VIOT                   | 0
>  4 files changed, 3 insertions(+)
>  create mode 100644 tests/data/acpi/q35/DSDT.viot
>  create mode 100644 tests/data/acpi/q35/VIOT.viot
>  create mode 100644 tests/data/acpi/virt/VIOT
>
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..29b5b1eabc 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,4 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/virt/VIOT",
> +"tests/data/acpi/q35/DSDT.viot",
> +"tests/data/acpi/q35/VIOT.viot",
> diff --git a/tests/data/acpi/q35/DSDT.viot b/tests/data/acpi/q35/DSDT.viot
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/data/acpi/q35/VIOT.viot b/tests/data/acpi/q35/VIOT.viot
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/tests/data/acpi/virt/VIOT b/tests/data/acpi/virt/VIOT
> new file mode 100644
> index 0000000000..e69de29bb2


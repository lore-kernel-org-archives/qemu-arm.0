Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp614741lfr;
        Fri, 16 Apr 2021 11:08:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqE4YzCkMNHlbU265/JXSaOzC7EP86Nxo6oftp8Pk4+b4qfBynLEQop4GD2dNmfR1hXs5e
X-Received: by 2002:a92:d342:: with SMTP id a2mr8516305ilh.57.1618596536728;
        Fri, 16 Apr 2021 11:08:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618596536; cv=none;
        d=google.com; s=arc-20160816;
        b=uJbvTbrNaS/xxez6UrHuol25gNchR9f1qs/1+bwcq55RVterEeSPFVlel7ydHIiDEH
         WanA9VQ0Sr2hWxsNxXsymOw5YKEZysz5MPtvLFvIrxrF6uA51PB0HwdRsgKsWWWTlYNn
         MhYAtyjzTWKt4ValyyVK8ChN7g7r2QtprqHy0ZYSvwkfzjogzLrgQ31mAP1WVSTcF16h
         EjCwzhLLR2bDiXupb/M5F6SJcnE+6fNBY0ECaA5REnrdlTk1jC79KFAk6oGfC3buFXKM
         dz4w5wdjpLiXD7q5cSoFjbWnvolUf1SbBXfUiszpV3EyI2qy+kaQvl2Pk0+E2zmF4b33
         8IpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=3pVFuXxCT94/rE1VKaOzhtzOogWJpP1UximY9ljCW3E=;
        b=ue73yBTzL2in5xwjjf/VfLQ1qqpPlrs2ip47CNndJI7m1H/RWrukAM8nqVbNAMGHnE
         DEKEn5i4yhQaYyBOYa7rpr2bN/UABKy7VqyIpS5+CDSuJTiFC3ubwZZDatYWRwUA8SsQ
         bMl8yymjfoArSb7zDRrAHwwrgO76kb+g9VkQ+238VPfr3oyk5xhelVAivZ9vpGH3pXcI
         w6sZ7+u60h1TLDv6iKDWRfmuXyJjUV78SdX/U3pPUGxDmBEDm4gbrVcBSmCd1KDBxkNp
         UqgbGF7Fo6OAhL586AxTW5JHyoxZ0xwtxg3eZUSyQCQF8HcZaYbTEdJjE5Bacb+rVOzk
         tVIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="TRI/n1de";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n16si2541694ioh.74.2021.04.16.11.08.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 11:08:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="TRI/n1de";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXStj-0005GD-W0
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 14:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lXSs2-0003UX-L6
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 14:07:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lXSs0-0006r1-OT
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 14:07:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618596427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3pVFuXxCT94/rE1VKaOzhtzOogWJpP1UximY9ljCW3E=;
 b=TRI/n1de/3uTQjfCOzyJp2UItfDrwyHfEFN3Uq0j5rJXLs05h7tAKIPMgaCRZ+f6MhJWqc
 uQAvkb8y0/IBS0NUCBeSmZxXV0q+rIgHteyMuSDIxBSsqk+UaorwoQM4tMKqP6QNkGbcXQ
 BYVHi7kTlIQZI5gvPA2QK7hWXyVvM7M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-540-iNPkHBP5MRaeWaeu5MiosA-1; Fri, 16 Apr 2021 14:07:05 -0400
X-MC-Unique: iNPkHBP5MRaeWaeu5MiosA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A2ED107ACC7;
 Fri, 16 Apr 2021 18:07:04 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-57.ams2.redhat.com [10.36.112.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E255560D07;
 Fri, 16 Apr 2021 18:06:56 +0000 (UTC)
Subject: Re: [PATCH v4 01/12] MAINTAINERS: Add qtest/arm-cpu-features.c to ARM
 TCG CPUs section
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm <qemu-arm@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210415163304.4120052-1-philmd@redhat.com>
 <20210415163304.4120052-2-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <2ff57bdb-3e32-dfa9-3c61-94e0fa0d913f@redhat.com>
Date: Fri, 16 Apr 2021 20:06:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210415163304.4120052-2-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tdSoviekDQXi

On 15/04/2021 18.32, Philippe Mathieu-Daudé wrote:
> We want the ARM maintainers and the qemu-arm@ list to be
> notified when this file is modified. Add an entry to the
> 'ARM TCG CPUs' section in the MAINTAINERS file.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 36055f14c59..d5df4ba7891 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -156,6 +156,7 @@ S: Maintained
>   F: target/arm/
>   F: tests/tcg/arm/
>   F: tests/tcg/aarch64/
> +F: tests/qtest/arm-cpu-features.c
>   F: hw/arm/
>   F: hw/cpu/a*mpcore.c
>   F: include/hw/cpu/a*mpcore.h
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


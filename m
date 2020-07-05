Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3837429lfm;
        Sat, 4 Jul 2020 22:37:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztZjeHvrhTUR1uaPLEADlMbaZDTxziVb2sOE+SRpK6F9gVe8/HIqkSXhiKdECuKOXfZrJB
X-Received: by 2002:a25:f09:: with SMTP id 9mr69301389ybp.45.1593927477209;
        Sat, 04 Jul 2020 22:37:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593927477; cv=none;
        d=google.com; s=arc-20160816;
        b=eMSTWOWIY2ZaRB9MnfzoElfgGl6pKFdVYIGLuovm1PwzzD3MKiGXXvhH63G8pZ/HYY
         WBNs4lTMd6hyhDqBOSttOWEuBvaFr6fCOPvPVoPrh26bWZOx8ef2zbMjfJMxecHFM9x2
         ZPTlj9seOB73lRQJ9svYionGko7XLLrUOLmzrD9kjYPIbCFOrPK1eQSKCUm+HrEIWRj5
         o3ezM5+XH64rx9Q4WyFLw/BigkUeBeLfnt7PdJAhUcfjrUZuiIDzIwLCXZb2G8361/Q5
         cN4CWVpnXxacz6Tdlk8SA/OSULlhxLLhdHcSVb8YxixmSLvVP+eZ3P2xyZo5hYGB93of
         Q2Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=QjMyNamLLkRJJI8ub+Padxcs+ybIZnNdDYQZ7F5eZm8=;
        b=tfu9+sCQaFR+to2aVuGOWlfVm8591D8R1Ir4ry6uuVB9AN4NuYNRjRVS/xCFjZu0Nt
         pDgk30QwK58yUHqNHzrJOP8ikXWEIqMIqfEM4hOx/XE1amPCMsuxA+ffSTCHTQm1/DXA
         Miw8xHijg+Tu2Zzl5vgPvEZyRVnnUeKDdy6xHRxbT6hCQ/3lFZaXoHxUg+hF0tLapTg+
         lxUCIKHHl2JAd37luSb7oJYrVzFneOcuTQ3iUmcWubtQjdGeK0VGhYCOQnc2dMiP5zrG
         jHMDdyHyaAk0DYyBaG9j+iyLqrczDlqDgjAPRimZiZ++TepLnzrTXDooHbczFMEA/mf1
         bHcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NqZ0p37e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u6si18100008ybi.367.2020.07.04.22.37.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Jul 2020 22:37:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=NqZ0p37e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrxLg-0001sb-Jm
	for alex.bennee@linaro.org; Sun, 05 Jul 2020 01:37:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jrxLY-0001s8-1Y
 for qemu-arm@nongnu.org; Sun, 05 Jul 2020 01:37:48 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:29722
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jrxLV-0006S8-TT
 for qemu-arm@nongnu.org; Sun, 05 Jul 2020 01:37:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593927463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QjMyNamLLkRJJI8ub+Padxcs+ybIZnNdDYQZ7F5eZm8=;
 b=NqZ0p37e8S6v0Tj3zP807s/jgXy1lZ3ZSyxU3IHZLQsl9ZEDP976bhXgYgR14f4id+rSRg
 QTPtqCg9WZhXFpzQG8Y3HRd/C5HrmvZlkPPfhm9wMzwV7lZeSXqD2KP0CMvBVR7pH9dbWx
 ybAfrhG6AJyhe4Y8RELNgQwPiKH4Qlk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-67ZeBe6uOxmFyIjf7BkLaw-1; Sun, 05 Jul 2020 01:37:42 -0400
X-MC-Unique: 67ZeBe6uOxmFyIjf7BkLaw-1
Received: by mail-wr1-f69.google.com with SMTP id 89so14260425wrr.15
 for <qemu-arm@nongnu.org>; Sat, 04 Jul 2020 22:37:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QjMyNamLLkRJJI8ub+Padxcs+ybIZnNdDYQZ7F5eZm8=;
 b=BpRm/gl6jCmimhZza+X/S/JHb7HAjRjfsJd6OnvEiyC2yBLbcYc3HSSl+c/a42RYRl
 FrgVMcsW9sL6IqEYJMYV1OhnUUGC+Dyfp4EhqDldI24GyVScY8fMAOgrBPFeDHVTdNIM
 J1uvu+0PQfo1FMhF9cAHtvXtkeG77/VodRDqJMUY7Rv8Odl8DCxTAAt7qogGXRpsaJUC
 7Rw3isR/94Chg+1eq2iubkl/yUvXxAQcWOMhtKBovPiZ/Hlg+6LqhvrOVPldN9HisFcd
 4epAk5NKRI6mhUt+dSVYq+BbS5rzG4NX7I6iQA647e/C5c+42SBPo8r4iWvYcpuCuKiQ
 LqNQ==
X-Gm-Message-State: AOAM530FH3V3wzw99ChNPAwQniJhm6b2FFzK1SWyEfBz9m5MEo8DegTD
 5Km320QJoQaOea4Fk9ZhPREWJ/jlAAWPuG45oEX2GWzNCqWafOfFtgLhzN/bJu40UImmWWBSw3S
 6MTqak3FBQ4Zr
X-Received: by 2002:adf:ded2:: with SMTP id i18mr43454254wrn.109.1593927461080; 
 Sat, 04 Jul 2020 22:37:41 -0700 (PDT)
X-Received: by 2002:adf:ded2:: with SMTP id i18mr43454210wrn.109.1593927460808; 
 Sat, 04 Jul 2020 22:37:40 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:adf2:29a0:7689:d40c?
 ([2001:b07:6468:f312:adf2:29a0:7689:d40c])
 by smtp.gmail.com with ESMTPSA id w14sm18980566wrt.55.2020.07.04.22.37.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Jul 2020 22:37:40 -0700 (PDT)
Subject: Re: [PATCH 24/26] hw/usb/usb-hcd: Use UHCI type definitions
To: BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20200704144943.18292-1-f4bug@amsat.org>
 <20200704144943.18292-25-f4bug@amsat.org>
 <alpine.BSF.2.22.395.2007041916060.92265@zero.eik.bme.hu>
 <f19dc1c9-8b72-695b-bce1-660e547e5658@amsat.org>
 <alpine.BSF.2.22.395.2007042140380.45095@zero.eik.bme.hu>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ba4dd94b-ec7a-b4ec-4786-c8c5dcd8127f@redhat.com>
Date: Sun, 5 Jul 2020 07:37:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <alpine.BSF.2.22.395.2007042140380.45095@zero.eik.bme.hu>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/05 01:37:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Huacai Chen <chenhc@lemote.com>, Eric Blake <eblake@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Paul Durrant <paul@xen.org>,
 Magnus Damm <magnus.damm@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Leif Lindholm <leif@nuviainc.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, Richard Henderson <rth@twiddle.net>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paul Zimmerman <pauldzim@gmail.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Mcr8272vFdkk

On 04/07/20 21:44, BALATON Zoltan wrote:
> 
> No it's OK, no need to list all defines. I just did not notice the macro
> argument that's why I was wondering where it comes from. This seems to
> be used elsewhere at least here:
> 
> hw/audio/es1370.c:#define a(n) if (val & CTRL_##n) strcat (buf, " "#n)
> hw/audio/es1370.c:#define a(n) if (val & SCTRL_##n) strcat (buf, " "#n)
> hw/audio/es1370.c:#define b(n) if (!(val & SCTRL_##n)) strcat (buf, " "#n)
> 
> Maybe writing it without the space between "# is clearer as then it
> looks more like it's part of the value.

I think keeping the space is better.

The reason is that CTRL_##n pastes together CTRL_ and n, but " "#n is
different:

1) First, it turns n into a string, for example "1"

2) Then, just because there is another string just before, the two are
concatenated, as in "CTRL_" "1".

Paolo


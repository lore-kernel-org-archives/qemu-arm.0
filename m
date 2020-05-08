Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp275190lfb;
        Fri, 8 May 2020 09:01:11 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ40N+ijpTCtEE8v0uJTb3aGGcFkKwFhFj7AkXKPeRgmcTIE4vCCZSSjdTPDGi0YFOuxwch
X-Received: by 2002:a37:9a13:: with SMTP id c19mr3674121qke.51.1588953671232;
        Fri, 08 May 2020 09:01:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588953671; cv=none;
        d=google.com; s=arc-20160816;
        b=F+W7esIdB3y544vQ8EBpnVpWrTEuNjO8P9Q+UJOo0VH4ZUzVccb2JlT4lIGWnta85h
         Nsem2bhqmUmS+1etNoJkDNpJJ5s7Cv6WUhlbD9/dOadZofZtFUgyKVVtkQ6iu1iP6Cjx
         EsmcyhHk7eGCmPCrJDrUprcIbF8QwTijV9USVaKiuLy1/wxdNC0mYEtwToxoUTrjBsvt
         5NGk71m/D2KIeYnmW7xHNVR9hZkHGrezaajP+aNl1usTO/V7hP7lyPx8odyGZLKYMcB3
         KkqbH84duyuH4PPZNtY1eBk7nucxTekmoCIEgwI6T4e0AbmwElUDOVFAunNLfCKGrdjC
         CEPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=wTUXMQmDa+FxahjGnXMPJb6FhVMxmy0XknlvBB2lhGQ=;
        b=S2xVuVy0kC0J1K6gTbRN/9jDx2+oyca4s76+oK7IPPAIMf8haCnK8HhjTsrgDzmgcL
         jh1vS9+APXDVMMD39MaQgr94iyRa2bIzdbtWpqFxiAEIKnR/DjGABh1SmQ49TsITsRqj
         KCe4HuoeXpzoSgV4or6zTR+cGQGhJhqzdXeM/f5ivCRDXLQQmku9EgVHZkzz3tFvVUga
         DlwZoJ/j5OLskshTLagS4Dthg9HYVZqqDXHUM2EuHAB3bFcIdrUoeWQYEy5TDo1nyVrq
         L46cXMylNh3ZIh7UqbWYiaDd6lBAFaxELNNjYWUhAjBx/lI6IrHSOnWAeHfD7fpU7Paj
         Ae9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ok8vTtJA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id o79si1286100qka.153.2020.05.08.09.01.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 May 2020 09:01:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ok8vTtJA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jX5R0-0005qO-Ky
	for alex.bennee@linaro.org; Fri, 08 May 2020 12:01:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jX5OW-00020E-8l
 for qemu-arm@nongnu.org; Fri, 08 May 2020 11:58:36 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:52630
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jX5OV-0001mt-Gv
 for qemu-arm@nongnu.org; Fri, 08 May 2020 11:58:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588953514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wTUXMQmDa+FxahjGnXMPJb6FhVMxmy0XknlvBB2lhGQ=;
 b=Ok8vTtJAUFdC1uLeL/Lbo20UTpftEhSX9uINft8AC2Rh0VGh1+7xNr5Hc44LQMj7Ombsqg
 KQnovvVPQXnsGxakLZ9GqwNSKwRFpRx9AKROeeNPd3zUfuJwq8azpbvfYE3zjviChXlxnW
 uHl30cYyAZGf43wCe0yF/H1aL/NmcJ8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-bPKuprJhMm-Icj0NbDKBfA-1; Fri, 08 May 2020 11:58:30 -0400
X-MC-Unique: bPKuprJhMm-Icj0NbDKBfA-1
Received: by mail-wm1-f69.google.com with SMTP id t62so5380283wma.0
 for <qemu-arm@nongnu.org>; Fri, 08 May 2020 08:58:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wTUXMQmDa+FxahjGnXMPJb6FhVMxmy0XknlvBB2lhGQ=;
 b=QhM8IlY8337zL171BriQURJVLrx/M0rMdZxYhVNZkenvNLORfnwCuU4JFSw2OWQSMH
 Qa4Ff8mtCC3NNHAIU8zf+HsGrOd8DITRjtXqiDhfYPmpY17kpcKGc+1uh2q+u9BTZFqs
 vTcnQykNdO4d6XAgEQx6331MtmWdO0BGWAxD0iJZGcE5F65y72jXlLiiPlFxinp8/7D5
 pOzLRxa2p+FnOjIJJ1DFRFyNZZwlXEL4OCPW1g7CelwVH0thdM8QkGV9Rb6PsjRcV0Dm
 PRW7KcZVG+Qx3uCKtWOJDuZ/quFCOseUrRhyaZV3h6D0H5P/ch5TtCmh/qtsrZ8/ArhH
 mnpA==
X-Gm-Message-State: AGi0PuZKsAR7aBz0up6D+0G/XPUK3VK9+oxDILCnIp7nSwWfMlHnjXgx
 Jvrkk8AAcQ+VVdPj57seBvhrD3AXgQCaWgCY/NqchUPnnnmoYyx0qkvARBPbvzDWnwbquor7kPP
 /MWodn6vwK5Oe
X-Received: by 2002:a5d:684a:: with SMTP id o10mr3558665wrw.311.1588953509530; 
 Fri, 08 May 2020 08:58:29 -0700 (PDT)
X-Received: by 2002:a5d:684a:: with SMTP id o10mr3558646wrw.311.1588953509281; 
 Fri, 08 May 2020 08:58:29 -0700 (PDT)
Received: from [192.168.178.58] ([151.30.94.138])
 by smtp.gmail.com with ESMTPSA id m1sm3379155wrx.44.2020.05.08.08.58.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 May 2020 08:58:28 -0700 (PDT)
Subject: Re: [PATCH 0/4] memory: Add memory_region_msync() & make NVMe
 emulated device generic
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Beata Michalska <beata.michalska@linaro.org>
References: <20200508062456.23344-1-philmd@redhat.com>
 <9396e0cb-388a-e08e-c066-82a60708ecdc@redhat.com>
 <CADSWDzvECqOXzusk=tj8r4z-E5CDZn4TNG8PJ5pxLHAn3saOzA@mail.gmail.com>
 <500bd6f3-2b14-eda8-72e5-56c46b7860bd@redhat.com>
 <653758ab-468d-b6f8-0ca6-404a799e3928@redhat.com>
 <CAP+75-W=DVYQuh0bVMRdo=mK8nLA=4VmsjJfXfO+TBwBj+aw0A@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <09b4b2f7-572c-08a5-d1d4-214609de8b85@redhat.com>
Date: Fri, 8 May 2020 17:58:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAP+75-W=DVYQuh0bVMRdo=mK8nLA=4VmsjJfXfO+TBwBj+aw0A@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/08 01:34:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Qemu-block <qemu-block@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Keith Busch <kbusch@kernel.org>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Meo96vgSOo0Z

On 08/05/20 17:35, Philippe Mathieu-Daudé wrote:
>> So I understand I can simply rename memory_region_writeback ->
>> memory_region_msync in patch #2.
> 
> (removing the mr->dirty_log_mask).
> 

Yes.

Paolo


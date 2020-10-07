Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp479449lfq;
        Wed, 7 Oct 2020 07:56:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1IngBhR85f/QhVtxC6/tIcROi2LRvCKV3NKR98TRpDDyNxLXMRlehqr4zBdGqkAhr2KMc
X-Received: by 2002:a25:3004:: with SMTP id w4mr4294882ybw.240.1602082612351;
        Wed, 07 Oct 2020 07:56:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602082612; cv=none;
        d=google.com; s=arc-20160816;
        b=LDHCHUy56qSkwVNnX6r4w0nbNnzZBiFOpkTFQVjjGRYFKstF+/+jkYSuG5Xe9tKVJ8
         iWaRVrg1HSls18TyQWt0nk7UkID9YKoGeJ/pA6FP+w9FRZ8hcFw40UPK/Bjy5H+9WFcQ
         G+DcHHcW1ibGb2hj7z++w0IVQpc2NEKkstoBWM5CutN7TKCdFeb/FUXAtxRqfs6/qQJW
         H0P0/62fsrs/H6T7kuvBwJwCNNFNC/rxgbvD+Eq7GP0rPtKeJwMa5Y06jpIH4vMaNonQ
         VGSShrbGkXt2Dy0Z65HHMIDGPOi6UJQ4ywy2cVpef/XcYF2g0gilGaUMBJlYytPTFm4T
         tTRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=2PtmRaao0G4zF+ZvjheASD8UzYZJ4ViJNIA5/O4iUuo=;
        b=Pqqoialeudlm+lYO01bOnwrRoZyYkVYVNLBag2dmgAvHG1jBv8DsYiZ5ukAhdRpOEc
         YIFiwIb1dIdyMJ9H7rEMQE+n+pVNyOXnYtqfT1ZRX1w7Ew4QkT8i1/0br+E67098e9d6
         tVRMysi1YezU/yRY5xlAd0dCQ3Xf06ZXbxUqzp7dPyMEvmm+2ZcBjENVewdCnRcyvTb3
         /YBR+zsBBzl2rhJRcXNnDdzmBNSW4KBRcqJVV/f52uNCy2n/KF7DF+BLBzbxoYzuz08L
         4OvQMcCYMkinsMLJgy0LyZe+CqSlpPcecjigiBQwTIJW6nE1BRlAphB01qsSRQJb4+S2
         2Gfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LYSFap8N;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g15si2160899ybk.356.2020.10.07.07.56.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Oct 2020 07:56:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LYSFap8N;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kQAs7-0007H1-Mi
	for alex.bennee@linaro.org; Wed, 07 Oct 2020 10:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kQAq1-0005rO-2x
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 10:54:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kQApy-0006qj-5T
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 10:54:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602082476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2PtmRaao0G4zF+ZvjheASD8UzYZJ4ViJNIA5/O4iUuo=;
 b=LYSFap8Nd0fEPUtTOX0r9EJrLZmDLyRJZNbHRAJtoWI5YvHPEo2gL1BrAJfIgpfSCbglbB
 cwX6qykGiKw2P0dVZ87fc1PaiKWasrNja2/j0iOzCXqvrsm7vSO1u8Kvj0HL/nMTHE7XWt
 +fEgwM5fglr5+Qts+i7LSMIU0JeM4DU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-rGt4OwNsO8OWBxuoN2jK3Q-1; Wed, 07 Oct 2020 10:54:35 -0400
X-MC-Unique: rGt4OwNsO8OWBxuoN2jK3Q-1
Received: by mail-wm1-f70.google.com with SMTP id z7so791115wmi.3
 for <qemu-devel@nongnu.org>; Wed, 07 Oct 2020 07:54:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2PtmRaao0G4zF+ZvjheASD8UzYZJ4ViJNIA5/O4iUuo=;
 b=LcbFMoEtZnWVF+d+4C4YqCAOVIwFIwRk2FJP0wLWTkqeVRytQE7iVf1oiQE6ZeTSsb
 6TCgytLDghgvo29I/Tb8ewALUB6RK+X2lWdCgzQbsOa1mrkAv7+Y6GFbx2Od2LcN0wmM
 Tr+qymrDTP5pqO7D8FqAp0qCCN9ogFrdiCW6YNq3FsUPJERfpP5kpxbi3Fc69+Y5Pe1o
 asw0RiL7Ktyul6OMJ+lzdk6YTDQ47DWAY2BdROCur31Eg5eXPyiY4Q1Lxc1XWp3++sfT
 p4HwP7QCpBS6ISxm0ykAsNc23lItDFEGi2V8U9yP5f7e53HeTJnF3Ap8Eq8CuH9QK4Rz
 J8lA==
X-Gm-Message-State: AOAM530BW3INHSDkuNgUacH4N4/X0fiM36gq4OrtMdNAABAkUnOwOQeS
 6GhTlWm7LGDrN+mrvX0brYwsOSHbwOROgHuNvDY1DzwVKUe/ejSMV7oN+NMAHoCgXDN22wDvYx/
 8ojK2I9BpXS2C6pc=
X-Received: by 2002:a5d:498a:: with SMTP id r10mr4106203wrq.106.1602082474102; 
 Wed, 07 Oct 2020 07:54:34 -0700 (PDT)
X-Received: by 2002:a5d:498a:: with SMTP id r10mr4106184wrq.106.1602082473866; 
 Wed, 07 Oct 2020 07:54:33 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:d2f4:5943:190c:39ff?
 ([2001:b07:6468:f312:d2f4:5943:190c:39ff])
 by smtp.gmail.com with ESMTPSA id c68sm2999307wmd.34.2020.10.07.07.54.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2020 07:54:32 -0700 (PDT)
Subject: Re: Purpose of QOM properties registered at realize time?
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20201006220647.GR7303@habkost.net>
 <a6e652d9-548f-4d4e-e451-48e3f5e11031@redhat.com>
 <20201007130240.GU7303@habkost.net>
 <659289e0-4133-b945-45fd-25e759c18b03@redhat.com>
 <20201007142742.GV7303@habkost.net>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <117cb090-d9ce-6394-42a2-2ac99fd965b9@redhat.com>
Date: Wed, 7 Oct 2020 16:54:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201007142742.GV7303@habkost.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/07 00:44:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 "Daniel P. Berrange" <berrange@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P1cHc18pSw/q

On 07/10/20 16:27, Eduardo Habkost wrote:
>> It is always wrapped, but (as far as I recall, because I have never
>> worked with GPIOs) they are intentionally QOM properties and not just as
>> an implementation detail.  It's meant to be accessible to the user if
>> only through qom-get/qom-set.
>
> Being accessible for debugging would be OK.  I'm just worried
> about dynamic QOM properties being part of a stable and supported
> API.

Certainly accessing the properties is only for debugging.

However, I am not sure if the _existence_ of GPIOs as dynamic QOM
properties is part of the API; that is, whether the user has to specify
the names of these properties to create some devices.  I don't think
that wouldn't be a problem anyway, what do you think?

Paolo


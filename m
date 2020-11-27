Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp2025908lfb;
        Thu, 26 Nov 2020 20:54:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxNZaXEDkNBo5li853Tre2xcCQtCP39xQZ7gXg8RnFl1EW9mrZx0VXH6poMWrNdRLeWlHda
X-Received: by 2002:a25:df55:: with SMTP id w82mr6817432ybg.135.1606452888004;
        Thu, 26 Nov 2020 20:54:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606452887; cv=none;
        d=google.com; s=arc-20160816;
        b=nd4yBU+yvcDdfobDgm4RlWBO4gWHLPUNcTUv7rRGQPH+oIGq0/8ULQvM2BXv/BkPP0
         PYYiy6b/qXeHta446Vl3wpNDheba+8voZWi1t5eDWcG9h8AhS/aXf/+l0x+gcCPOshsC
         GY99oeOH8er6LjZ6zQXkFKX5kMqSs5MG7BKPfT64fCHIkC2wphDgCOcybu42QmyF/wam
         O9S2G0E8vWaBVkCoMhD4CvYoKkCe5jTVJbbU3KwY85Ttpoy76eEK+d8E4RiJtXcjc9BP
         xIGxlpbncd87ps0Gl1A+V59SubPQLm/C4Kj2q+EsKZrYg0uiutsmynWWMACT4/hiCxCB
         usXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:subject:from:references:to:dkim-signature;
        bh=EegMfjvfPRjcfawqS2tz8g2pfdyCcUkD0dnKUymgO9A=;
        b=Z6ECSGUhK19uX+ZzVYGv1njD3nDW8MVhsEO8PyPtYi2ZK0mNFcre8LGnWqK8Qfku5g
         0DBcsDv+rfHZnSfnvp5vv68/p95AotZU7pFQ+kIZFaSXDFWnLOlZJEwYvI3DB6zCSw3b
         hX8cGcSLoIY3SWrUtH1jb2ACJnzj9J2vL5J0Mzwom+WeVNHAKuUFpM/so/6gWxPSlm2B
         WH+a2IwAwAbLbgiXoemBMCdwN4rUOfKmDbOoKAYbIUeZNH48wK2YPfbiDaKWHX2hGiKa
         +GL/+aCNH8d7DN5NZCePfsMlCYz6oqhRiMeRWh7G31p7ALT/qT1pYKp5hduD7vaDOSc8
         F22g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RNK1lUU6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l8si8071261ybb.185.2020.11.26.20.54.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Nov 2020 20:54:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RNK1lUU6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kiVmR-0008S0-CV
	for alex.bennee@linaro.org; Thu, 26 Nov 2020 23:54:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kiVm3-0008Pu-3u
 for qemu-arm@nongnu.org; Thu, 26 Nov 2020 23:54:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kiVm0-0005ji-G4
 for qemu-arm@nongnu.org; Thu, 26 Nov 2020 23:54:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606452859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EegMfjvfPRjcfawqS2tz8g2pfdyCcUkD0dnKUymgO9A=;
 b=RNK1lUU6J7N4DVHYX2MPtfeNYi7xa9mp1q+qPa58LBH53BYvopIqmpoDyaKTR+gSe1N5BC
 cXp9Lx+J9fyLGf6iGKONQ0t8rOE+T88akhGjFYrhL10K2UrgLEcrA7/dUSeRb0vDYZvnwY
 uMQJ68Kx0k9mQm8ECOcwLDzMNW7ndok=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-GltODchFMq-HnkZOAKfJww-1; Thu, 26 Nov 2020 23:54:17 -0500
X-MC-Unique: GltODchFMq-HnkZOAKfJww-1
Received: by mail-ed1-f72.google.com with SMTP id n25so1967871edr.20
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2020 20:54:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EegMfjvfPRjcfawqS2tz8g2pfdyCcUkD0dnKUymgO9A=;
 b=UM6AuFzsEKUg9uRUH6NchkXUJkK5Zace4S5smQM9AsmwHr1sG88upG8j2WHZ+WZZ7s
 PSEGOmbU3wRlYDdp1l3yo//wPMRshWRct2xsj2Z6SSVPD8oEI2Bxpi7LxnEGKbGBxKNb
 jn5tTq8T/XnVLf9I3tVAnt+TxmvEudt1Snvr/gtMCIChJf+RfhGY6ndAdqe6BNfmH99P
 y+1ZFBreG7jD+WIPfEREEWPOI+kG25nrDU9oeF2z0ZQKA2jbw2FWG8LbENirLFcrtNrn
 uUg+AsbjWF85dFC+naDHT60ITp04Jt9h5pnHE8omfghf1PtMb0qo7u0v5ubZFa5DnGCM
 7qAw==
X-Gm-Message-State: AOAM533ABE5UlLLgRIQJHvlvQ2zgHdm+IhbQXihL+wCYxrTuuRL89B1M
 N8WtNKc+9Zger1fpv4DgbA8oZ10AyBtiHTfo92QyMymI+wcDGDI9Mgtz6mTk1EkhABwJ2h7ngrQ
 1BLRmoRbgbaLf
X-Received: by 2002:a17:906:d92c:: with SMTP id
 rn12mr5658394ejb.472.1606452855829; 
 Thu, 26 Nov 2020 20:54:15 -0800 (PST)
X-Received: by 2002:a17:906:d92c:: with SMTP id
 rn12mr5658382ejb.472.1606452855662; 
 Thu, 26 Nov 2020 20:54:15 -0800 (PST)
Received: from [192.168.10.118] ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id a12sm4333376edu.89.2020.11.26.20.54.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Nov 2020 20:54:14 -0800 (PST)
To: Alexander Graf <agraf@csgraf.de>, qemu-devel@nongnu.org
References: <20201126215017.41156-1-agraf@csgraf.de>
 <20201126215017.41156-2-agraf@csgraf.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/8] hvf: Add hypervisor entitlement to output binaries
Message-ID: <9ff569f7-b582-2d13-e17a-08d79e0d40a7@redhat.com>
Date: Fri, 27 Nov 2020 05:54:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201126215017.41156-2-agraf@csgraf.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Jw9mYFt7x8EB

On 26/11/20 22:50, Alexander Graf wrote:
> +rm -f "$2"
> +cp -a "$SRC" "$DST"
> +codesign --entitlements "$ENTITLEMENT" --force -s - "$DST"

Slight improvement to avoid races between ^C and this script:

set -e
trap 'rm "$DST.tmp"' exit
cp -a "$SRC" "$DST.tmp"
codesign --entitlements "$ENTITLEMENT" --force -s - "$DST.tmp"
mv "$DST.tmp" "$DST"
trap '' exit

Paolo


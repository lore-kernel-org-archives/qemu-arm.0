Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp2279526lfb;
        Fri, 27 Nov 2020 03:22:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwYauS7IuWKcQuaEdBpi16tzBNtgIWrtM4H7KCaUiMWRE+SVnX9Gy/cuV/WNXpbYaAuwL3s
X-Received: by 2002:a25:e7cd:: with SMTP id e196mr9139471ybh.375.1606476147598;
        Fri, 27 Nov 2020 03:22:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606476147; cv=none;
        d=google.com; s=arc-20160816;
        b=g9lcM+8c3h3U9+rp1wkinT+bXT4eyOE3h3s8kkuB231swSXprSNVwYhkwzSJSkWbF1
         32uFpOCKhpq5IL3i/Aontf2CD7iYGQhWSggD+jJpnaEmwaVYTSKI18+l8vqLy6Fl5uSb
         LVS3OadGXO/eYUmyYEfjEOc+EeWRHh4Hap+WsBqPIK4pUAIB+Vcq3XG/jlg3dMjFhkTy
         FK86takomN5yWdfW1MFjQzyj/jBg9MztA3PWbi8a9I2TlTl70cIVbueLGuC8aLPCVae2
         HUAjmjdlGW2sHJ7Ak7RmkWFolkSMaQQStJR5R+oyCNvMdi8j/duE9aNtsALXj4sbO5uq
         1SNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=uytEnzd5RnLqkxyG99LgfZKGByo+m6u1C1WcR0r6ujg=;
        b=kAjEiLb09lT3L9foUEsY3m7DgHz1cXj+6mVelCLKFcwlwJ/sdMCT+RN80tEqcVjkjv
         fXgH3Wdy7kwEkCBey+o4rvnZhZfA8QwNhyYA+wtBh2HtW1AUo2kn1z+YYhmpdc+JJWgo
         hbfmvxzWg0ihuNgNUMXap4mMIyDJ4VZ5m/2X9HRla2UcJ0LgXiog8af5PTUelZXNYphB
         IIrC71jWXMzrsiSXOvneu4O3yle/jyP3irtfbTeKB4q98KYJXHc33JgTQKl480oBIjQN
         kEBPRG5gvM9Ddb+fwkMTkrNK2Ng4gtfkU/AzbCJ7GIiiyGA492anCkO+kNQn28YDy9FF
         KxMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Mn/xB5LH";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n72si8178327ybf.122.2020.11.27.03.22.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Nov 2020 03:22:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Mn/xB5LH";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kibpb-0002Xz-1B
	for alex.bennee@linaro.org; Fri, 27 Nov 2020 06:22:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kibpR-0002Xa-Hf
 for qemu-arm@nongnu.org; Fri, 27 Nov 2020 06:22:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kibpP-0004uV-T0
 for qemu-arm@nongnu.org; Fri, 27 Nov 2020 06:22:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606476134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uytEnzd5RnLqkxyG99LgfZKGByo+m6u1C1WcR0r6ujg=;
 b=Mn/xB5LHWMySoU7rhHcgQ+JAa+1Dz4btJ3PHfOJRlj2ifnckOTVvj/ObRXQTpBaCArE7Fd
 WIx+md/Frcw+0mmBg14Bfnlm1yn3tmGnHo/H9oS9C9knKIgqKm9r9H0T11sd48I/anEQA3
 JN3pUXLud976JuAQvmiQESZIxZoLrSI=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-hKAeGn6_PfSRhu8DGAIPkw-1; Fri, 27 Nov 2020 06:22:13 -0500
X-MC-Unique: hKAeGn6_PfSRhu8DGAIPkw-1
Received: by mail-lf1-f70.google.com with SMTP id f16so1814415lfk.7
 for <qemu-arm@nongnu.org>; Fri, 27 Nov 2020 03:22:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uytEnzd5RnLqkxyG99LgfZKGByo+m6u1C1WcR0r6ujg=;
 b=jEowOi4gQcMpMfX1bhdMjUpL8+sZw3YiWaAabd2S9p8fyZ3CR44wqwb7IceKuJXOJ9
 soOJqiq4v2g0XSmbFqeAesNmvc5HYB96VMf3EWHFtYEcQij6arulV9uLy9NjqIOKFKA5
 u7oT9qGxH9jdU6S1cH5mdFh+EKEaCCGhEn0dWxRWYD+wK8z0A887gewRc4Kfvg1lU+Rf
 pSoYMimeF2P60hQ3N+5x4CQHNLozXosX5X/u5GqWave5+V8jzsor64ytM0RJO49Q1Sin
 wbU7B45Rl/MhFfA19iR8s36PrM6e1LAeMPPP8DkgNGWUVMg+z/S+ycSm+eME26x2LZqV
 uOZQ==
X-Gm-Message-State: AOAM533KUiWllgdgG0deprAsTOzh+FTyQnxY2Pe85M7eg5+ouAyJyVda
 WLP5ixDj2hm5g+RvKY9cF78ivixl8T+/1iSzLXkPSO6kPOth4/qNfHkmkB1Cc2oiodL1s51pIuW
 yXjcdkl3ro/M9
X-Received: by 2002:a17:906:46d2:: with SMTP id
 k18mr6869786ejs.33.1606476129317; 
 Fri, 27 Nov 2020 03:22:09 -0800 (PST)
X-Received: by 2002:a17:906:46d2:: with SMTP id
 k18mr6869074ejs.33.1606476117002; 
 Fri, 27 Nov 2020 03:21:57 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id pk19sm2403616ejb.32.2020.11.27.03.21.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Nov 2020 03:21:53 -0800 (PST)
Subject: Re: [PATCH 4/8] arm: Synchronize CPU on PSCI on
To: Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>
References: <20201126213600.40654-1-agraf@csgraf.de>
 <20201126213600.40654-5-agraf@csgraf.de>
 <CAFEAcA_XZu07Fg3G05VWYDYTJfMSAzOH5yyd=rFLJVa73juDtw@mail.gmail.com>
 <785c216b-d4b5-b65f-1ddf-4c6374b72ece@csgraf.de>
 <CAFEAcA9QUfBQpmH=8_A+xDm53GkkOgFEDnkTDXOX_1A-bFg0Ng@mail.gmail.com>
 <284d0cd2-268b-b937-3a6e-d074ce28baee@csgraf.de>
 <3594db71-c72f-2946-ffa5-47da737900c6@redhat.com>
 <bfbf4660-5e34-5fda-e71d-b88670d6dad7@csgraf.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6260c875-bda1-35f3-20fa-a1c05396250d@redhat.com>
Date: Fri, 27 Nov 2020 12:21:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <bfbf4660-5e34-5fda-e71d-b88670d6dad7@csgraf.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MF/pDbrhHovS

On 27/11/20 11:58, Alexander Graf wrote:
> Mostly because there is a lot of super fragile logic all over resets 
> atm. Init setts dirty, post-init clears it. Then the arch reset handlers 
> assume that state is not dirty and fiddle with KVM reset ioctls and KVM 
> register modification ioctls directly. Mostly because KVM for the most 
> part implements its own reset logic.
> 
> I'm fairy sure I'd break someone unintentionally if I just throw this 
> into the common reset handler.
> 
> However, if we're happy to fix the fallout when it arises, I'm happy to 
> do so.

I'll decline the offer. ;)

Paolo


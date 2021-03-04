Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6257066lfg;
        Thu, 4 Mar 2021 05:57:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyidAlk1WzLrhY7mUJMaT4PtoXngnwNtT3sUU8eCB2bFB4NwK+b1BM4h0fFNEojiAvokanH
X-Received: by 2002:a6b:760d:: with SMTP id g13mr3683114iom.84.1614866255580;
        Thu, 04 Mar 2021 05:57:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614866255; cv=none;
        d=google.com; s=arc-20160816;
        b=CewKAeDQ1Dx+UbH2qqXph740yXmYHq+9R2hO/MoJMf7u+54RJQb+LoXossNlyXlKa4
         lee3C7DQNj1LC+uxPsBOVfgYndPvqTT5aGeRoJvXvRh9ciI7+NvJAqP/3d2Cg9UcxjBT
         PmbopZdwDsmLzxL0xG71dz95bUClxQRm0996h1A5Me9oSBVss53NWCYaem3q+4zjoJev
         anZ6TRyBthdpyepYCvmaeBKsihlucsHKc2woffzCJ1EPqLJ2oeJRUIbXQjix7pZPkPGM
         FzOusCTyugv46kkv1p0okCqrUBW7C89an0uywpjU1PWYGWOQ7wi/igU9QWra7ej9UGZJ
         8hTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=MpHX/a7yCBReDRTGDYwwyxBKDLq55HbfjE9ITkwtBBE=;
        b=O9v+WmtQR+C9/bFGBsT5PHoWZi1fwifqZaHWLg4Pp4fGVvuzilr+Cs7CSPjeEjnEJN
         3/mGrrAK1ZnKxg6Yd7RjPTKzCYBECxzZT93CDShBVT9NPRi9x0QOZl5DJE5niSOkfovo
         jGk3kAGUDQv7DjDPgwdknev4QD0kIo8BTssxPh1FPKVShTNa3g26Z/fp+LwQJFmTjhRh
         w+k3xlPWfukHcCK2axHTfjiRPx2MjjSqy5bg0UDamVTXhlJm/jHJHwdGa1C0ZG5/M+mm
         EATbBFuLHfg7haqbWUrb/K01QBs8fN2v9/YzjcdQdwikQAS7zMoNA2O2wA29Z4ahgQ9F
         mf2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gzCsrWqS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e10si8664043iov.47.2021.03.04.05.57.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 05:57:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gzCsrWqS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHoTu-000466-Ub
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 08:57:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lHoTI-00045S-MB
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 08:56:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lHoTB-0000rX-0k
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 08:56:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614866207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MpHX/a7yCBReDRTGDYwwyxBKDLq55HbfjE9ITkwtBBE=;
 b=gzCsrWqSVBsJ0KZrmgOpfTApoFKqOs+7yMsbQVv4PW/SSWLtqnKKomeDtaENltp1w8+CCs
 Iclf5oZw3UbgotSQ3uSAbeiJM7XAgEuWURbfgo8iyb3hFZzBDveSUVFKTRP69SbVqYKQfa
 7k8IN/bEi3qqwWJgf+AmbDb0FvZSUeA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-Bjfj1PsAMqatgZfRlwQoMQ-1; Thu, 04 Mar 2021 08:56:46 -0500
X-MC-Unique: Bjfj1PsAMqatgZfRlwQoMQ-1
Received: by mail-wr1-f71.google.com with SMTP id h21so10005873wrc.19
 for <qemu-arm@nongnu.org>; Thu, 04 Mar 2021 05:56:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MpHX/a7yCBReDRTGDYwwyxBKDLq55HbfjE9ITkwtBBE=;
 b=oU6dTGwtNPRwzpZ8HGvWoMAf+sXDk7asjQ814lyCVv5peKqJ3Iika1X0ctuj2GjjWR
 1Q2+5uNJaW4STYZezOi3/szCEFHjnzGo5PRAzfbmhEMitOl8BpsxEm64ZmrVqAB2Hekp
 kPdFkwluXkIJprfePkqVqBU9XTKJxRcUVc93LYnCHzUZhDanHpkotAhPhaiCHugEQgL1
 uJsb383TId6vcBF9ufCyE6og/sxPiO4kLAa7Yvp6dGiyn1EsJHPzJSOKLcQ8q/cahgQ9
 xHhYd7N1A4GfAI6UP/jLa1Y5lnN2k/QIPZGCJFS5X1oBA40lIgHxPVAfTG3kDPO2tmM1
 +ozA==
X-Gm-Message-State: AOAM530JPd/0nsuh1CsBdcffvR05DJ/7wCKr1GJhg3EYY6AJ/YUk3S3r
 x14AF3gLHCYpE0oIZ4b2KxmrbYtly4WWHIxZ83q9EIEZlaecPINJLTLKlRSrn21zVFdLBlDHj4B
 iEthvkfCP8vdp
X-Received: by 2002:a7b:c041:: with SMTP id u1mr4049884wmc.161.1614866204899; 
 Thu, 04 Mar 2021 05:56:44 -0800 (PST)
X-Received: by 2002:a7b:c041:: with SMTP id u1mr4049856wmc.161.1614866204738; 
 Thu, 04 Mar 2021 05:56:44 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h20sm9649878wmp.38.2021.03.04.05.56.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 05:56:44 -0800 (PST)
Subject: Re: [RFC PATCH 00/19] accel: Introduce AccelvCPUState opaque structure
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210303182219.1631042-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a84ce2e5-2c4c-9fce-d140-33e4c55c5055@redhat.com>
Date: Thu, 4 Mar 2021 14:56:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210303182219.1631042-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Cameron Esfahani <dirty@apple.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Marcelo Tosatti <mtosatti@redhat.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-ppc@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cC+IgpXqJoWN

On 03/03/21 19:22, Philippe Mathieu-Daudé wrote:
> Series is organized as:
> - preliminary trivial cleanups
> - introduce AccelvCPUState
> - move WHPX fields (build-tested)
> - move HAX fields (not tested)
> - move KVM fields (build-tested)
> - move HVF fields (not tested)

This approach prevents adding a TCG state.  Have you thought of using a 
union instead, or even a void pointer?

Paolo


Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp9204922lfc;
        Fri, 19 Feb 2021 09:37:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzbCfecVbbH2yevLJk05gzu34m2du64DUYwSnT+22DhErIiAzvrtavbqIY2/cb2kEdc7vER
X-Received: by 2002:a25:b8a:: with SMTP id 132mr14956486ybl.488.1613756237093;
        Fri, 19 Feb 2021 09:37:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613756237; cv=none;
        d=google.com; s=arc-20160816;
        b=mLcbjQ81eArBU84LKvKfIxrZeXMZ3J58S+ip8BTNDNUiC1ivF0SRIZTAhcYwWsSte8
         hwmyZizKOmodBlY84Xk+QcIG4uuh45Lgu2gvpQNkflq+eFI4Zrl0J864qUjNFGJA3sc4
         ivnd10WrZ2fjk6dEZf/KmLES9fvD0GhZFJLaT0BHljhan07bDg8su8NPPwSnMA0rm3fc
         +gidfSzImxUSAvmbpDnoACrZnN02llLG/BIwcmsht4P6YRJoSZm9FKXHPCvtgDet1rI1
         AbW5BAT7Xg8Dm5sY7NBm4krBaSOqnkR+dDbTUKcQ1564vTFj10HU6RtOU4/Dsdqf5ZVk
         FCAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=/iQIYzCUzufPYt+TLigNIgms1BaZgh18m0vewYul3GY=;
        b=eFBXLVyrlza82WnbtFBXSiCThBZMwgZaG/7A9E2N1zDhJScWGmqmhz0bOygNYvubZg
         shQ/oWPMkaNrQUKUdVqeboqOa+RMhaICnTP5KVO/ApUU0t+7PiSjX0glo4PMNJlzPpsX
         cRMcv7K2eG9ltITFZtr8RrBzHO8whZioyeRfhulUyWdrCcpMyDDCRbEKwHqr66kogrCd
         e24jWBg+w09/TmcQX7vGYkZsY9oc2mJao4/Aj3M0Rb85KfNM2NHpjCpNEZSkOtci5dYG
         6lZhOJL2n9rZtDwjOffHfWIhUeGNo4DmK8yDEDb83Hjg5+hA2qfOeFU0IoD52lSmTpG/
         IWcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="TXh0h/cz";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x16si8802055ybp.480.2021.02.19.09.37.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Feb 2021 09:37:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="TXh0h/cz";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lD9iO-0000yR-DU
	for alex.bennee@linaro.org; Fri, 19 Feb 2021 12:37:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD9iD-0000vi-1S
 for qemu-arm@nongnu.org; Fri, 19 Feb 2021 12:37:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD9i6-0004sI-Ln
 for qemu-arm@nongnu.org; Fri, 19 Feb 2021 12:37:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613756213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/iQIYzCUzufPYt+TLigNIgms1BaZgh18m0vewYul3GY=;
 b=TXh0h/czXA/+ivAXl+6V2ZCkfqbG14iPb+muqGGWrZp8MDUAvLGPFEFjGt0fGElQwW3jwQ
 DEXA/1kkd8sZAssgY9W434C3lzaO84LG6drhFFiYccwvIU3ab8rwRYcJBGWS8t1S6pYKHe
 aYXekDB53Wm82vgweLo/ZtVz6WW1yoI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-iEBMkY-8O7CPi87xXMGk4w-1; Fri, 19 Feb 2021 12:36:52 -0500
X-MC-Unique: iEBMkY-8O7CPi87xXMGk4w-1
Received: by mail-wm1-f72.google.com with SMTP id z67so2787240wme.3
 for <qemu-arm@nongnu.org>; Fri, 19 Feb 2021 09:36:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/iQIYzCUzufPYt+TLigNIgms1BaZgh18m0vewYul3GY=;
 b=f/+JdXib/7XJwOr3ATG5zLEcfZTm5Ke8v023NVsPw8Jt6r63tOc3gmxNQhP7V9GrWX
 l+YWyH1Mk3dCjCo1JEcIOkM0VMKi6S8e36RN+1fKz9EGhdtzv4Y1gdwjnEy5xnD1ph50
 yMMH8R8DJb6Vpe/2tOc3hdbZNV6oMkQ+wBWbEsFIzT+gzw7OFW3qBHE18aSeoEaAmq1g
 7SBq6r6Q12j/aYKRnr7c4lTVJ53h/FRDiCynQTEM/vBqS9F/w+mdrKZjwc313Vzojii/
 6ZsifYM1jzrJZZmF/N3191pi7Bfsj/7vx4kPoFlKxDcxtjFlBgtzJLeI8HWz29n/wN9S
 NnEA==
X-Gm-Message-State: AOAM530f2tON9gK6+y6XZ65FKHOhMbl2p/j8ZWm5kaagXsfAcm/VFWL4
 X+w2Phv8ObdywXCbfYfAsvEVg97w7E6M2va0wq4X8s8bSbJi4kHDF3uXqtHpc6CjsqXDKyI9gFz
 HkKI9e0khw+Ba
X-Received: by 2002:a1c:ac82:: with SMTP id v124mr9187714wme.97.1613756210994; 
 Fri, 19 Feb 2021 09:36:50 -0800 (PST)
X-Received: by 2002:a1c:ac82:: with SMTP id v124mr9187679wme.97.1613756210811; 
 Fri, 19 Feb 2021 09:36:50 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id k15sm12593212wmj.6.2021.02.19.09.36.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Feb 2021 09:36:50 -0800 (PST)
Subject: Re: [PATCH 0/7] hw/kvm: Exit gracefully when KVM is not supported
To: Claudio Fontana <cfontana@suse.de>, qemu-devel@nongnu.org
References: <20210219114428.1936109-1-philmd@redhat.com>
 <89bb6db0-0411-e219-3df8-8300664b54f3@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e59f2ee6-b438-5dc8-d236-adc9b5e22988@redhat.com>
Date: Fri, 19 Feb 2021 18:36:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <89bb6db0-0411-e219-3df8-8300664b54f3@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
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
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Leif Lindholm <leif@nuviainc.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hpFGGyxyI9Pv

On 2/19/21 1:34 PM, Claudio Fontana wrote:
> On 2/19/21 12:44 PM, Philippe Mathieu-Daudé wrote:
>> Hi,
>>
>> This series aims to improve user experience by providing
>> a better error message when the user tries to enable KVM
>> on machines not supporting it.
>>
>> Regards,
>>
>> Phil.
> 
> Hi Philippe, not sure if it fits in this series,
> 
> but also the experience of a user running on a machine with cortex-a72,
> choosing that very same cpu with -cpu and then getting:
> 
> qemu-system-aarch64: kvm_init_vcpu: kvm_arch_init_vcpu failed (0): Invalid argument
> 
> is not super-friendly. Maybe some suggestion to use -cpu host with KVM could be good?

I agree this should be improved, but it is out of the scope of this
series :)


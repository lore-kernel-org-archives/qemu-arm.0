Received: by 10.25.0.144 with SMTP id 138csp586793lfa;
        Wed, 12 Apr 2017 22:09:31 -0700 (PDT)
X-Received: by 10.28.226.11 with SMTP id z11mr1187770wmg.91.1492060171342;
        Wed, 12 Apr 2017 22:09:31 -0700 (PDT)
Return-Path: <paolo.bonzini@gmail.com>
Received: from mail-wm0-x244.google.com (mail-wm0-x244.google.com. [2a00:1450:400c:c09::244])
        by mx.google.com with ESMTPS id v24si22203618wra.112.2017.04.12.22.09.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Apr 2017 22:09:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of paolo.bonzini@gmail.com designates 2a00:1450:400c:c09::244 as permitted sender) client-ip=2a00:1450:400c:c09::244;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of paolo.bonzini@gmail.com designates 2a00:1450:400c:c09::244 as permitted sender) smtp.mailfrom=paolo.bonzini@gmail.com
Received: by mail-wm0-x244.google.com with SMTP id x75so10271780wma.1;
        Wed, 12 Apr 2017 22:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=hPD42R3ilERrjbPlc8Y8iZDY97UzeqPfDVEJ6BHByQw=;
        b=bLWcm2mwviv+LpBj98z522hBKArXrfqxJYb/4IHdrInE2zQuAer0oYCvRuwr+QlqaJ
         NrGDCC5V9J8mpQy+k12d3sXwj3ywpGLE/DLnyjTqx/Vp82N2FyYjFEWsYFX8D4qmXauA
         Urji9aJDi3dN6Rx5EEotdg9KBLm17Alx6Krrs+G6AufyvXPojpASJj11bTg7Cm4+vNlJ
         7iWne9mw+jiDCUbfEdBXFNDOEpiGW9QdyiUzNpIQgnS8PQjCY3jtWswRLS79NeURA1Jp
         J2fDxFjqlVm1cTdz9VEe0YzHia1tgirjbqB2aPMh/7ibDq0wJ98Qr987Nfv+V6dEqZ8y
         0nCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=hPD42R3ilERrjbPlc8Y8iZDY97UzeqPfDVEJ6BHByQw=;
        b=SID2z+FockmMwzi0zCrmWcNR8YI60jMu0hrLx82fKlc6jvxyvxdeoFt/kpBNUfo4QX
         woE/jScc2Pp00aDD6SC+PbBqCDJgZujudf6MIZN4uKdqCXMj+2wT/pGz3WiMLZGSzOCE
         M3Rf8dJKF83G114AcjH8RtmTu16jZ8taAkodtgsBs/FIpcIIqgOUmyXGN71WCPHnkXpE
         U3+MCxsOkKDkdUOuGqEjQ/xYqy3K0xazJcVsvFk8cFlZWhF+BrxmuXYRqr92yobjCJ2I
         eP2S+o0hpq5lNSZ8hYtpxXvyXMJ2znJzObHKpPAjPYz0h77hoR+e9DYOn2veGAfJTW1C
         traA==
X-Gm-Message-State: AN3rC/4VHcXjH4hFyCG0m/Z/TxhR6EKjmVjcR/QQHv0FPv2cBlroTEPw
	gjUmddXN2K1Fag==
X-Received: by 10.28.39.132 with SMTP id n126mr1329525wmn.16.1492060170682;
        Wed, 12 Apr 2017 22:09:30 -0700 (PDT)
Return-Path: <paolo.bonzini@gmail.com>
Received: from [172.16.0.9] ([95.211.209.82])
        by smtp.googlemail.com with ESMTPSA id n6sm28132785wrb.62.2017.04.12.22.09.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Apr 2017 22:09:30 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Subject: Re: [Qemu-devel] [PATCH 05/10] tcg: add jr opcode
To: "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org
References: <1491959850-30756-1-git-send-email-cota@braap.org>
 <1491959850-30756-6-git-send-email-cota@braap.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Crosthwaite <crosthwaite.peter@gmail.com>, Stefan Weil
 <sw@weilnetz.de>, Claudio Fontana <claudio.fontana@huawei.com>,
 Alexander Graf <agraf@suse.de>, alex.bennee@linaro.org, qemu-arm@nongnu.org,
 Pranith Kumar <bobby.prani+qemu@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <56cc09de-8ce4-f264-195a-393387e28ec0@redhat.com>
Date: Thu, 13 Apr 2017 13:09:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1491959850-30756-6-git-send-email-cota@braap.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-TUID: 0qJA/yuDkska



On 12/04/2017 09:17, Emilio G. Cota wrote:
> This will be used by TCG targets to implement a fast path
> for indirect branches.
> 
> I only have implemented and tested this on an i386 host, so
> make this opcode optional and mark it as not implemented by
> other TCG backends.

Please don't forget to document this in tcg/README.

Thanks,

Paolo

Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp120223ejq;
        Thu, 4 May 2023 00:22:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5jo+dwk2AuK9dl55K4/+UQkaOffryP93pG2mJTIElEyDxGvb0e9ATJS+Dcl7XeFZgSd5Wm
X-Received: by 2002:aa7:cb54:0:b0:508:3f08:ea0f with SMTP id w20-20020aa7cb54000000b005083f08ea0fmr683348edt.28.1683184928255;
        Thu, 04 May 2023 00:22:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683184928; cv=none;
        d=google.com; s=arc-20160816;
        b=JEYmuEPfpnq724t3H2UTAuqSz+RlM45AMdKuMR7qM5W3QssBrnauQrblptABrHVIIC
         yw2VcHN5pKmc6PTpEGffY92ayWWEv8R2s7y29ipvI2Sq45a326uoH4NggR/pMYctzFaa
         WOaNScno01S4cIS24YXiEYvH4GKryypjinbWRcfAps51w9qG2/XMgKVIUAN3clhpBnCV
         z5gbDZf+OCqHGSEPIwhUh3jaO+9jLnOAG8HcuHKvVQ3+fJ1z2nJzku4Dt0DSZLo5hWYo
         MjCrxxG+E+pSWgQkYPtq/7WzOmSiPklVMrT1AO3XtDfBOTL4D5kxPSFf3yUAqnpJ0iCP
         iqSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=e39Mds89jzC7NxhVhmQSaRaXl64OT15r7PbFamEUc1c=;
        b=MZljDsvTTx3FPFsw5/yAVa8c6WXfhAumU+y1lU5gf5xeqaQWgbwj/8zGhVY8qhkLMY
         K652TJlYwzIf9YyH/VchoU0sOCNraBU5BY5ULa1QLcrgcYCLtt2NZUR/PNPnBsr/B1MG
         4tDJjwbKdeXN09IDVtLyd2mhykOeumKAiHRMbxZPNHX22dGtAiszCk4KRko7CJNaHM25
         rrz5LOUIDxQBC8u8f92MIO4xbs2A3HRcrs5LxpJhqMhlkoR9aIj82J73nh7/a5g+ccw6
         5x4WtGFzE2JuCY3mR8RwnlQIRQTXCfB8DY5ap4tr4axL5z2miEEjk5Igvb8GOo7SeSR+
         Vr8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OJRuVEsY;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id j23-20020aa7de97000000b0050497afaeedsi2149338edv.11.2023.05.04.00.22.07
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 00:22:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OJRuVEsY;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683184927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e39Mds89jzC7NxhVhmQSaRaXl64OT15r7PbFamEUc1c=;
	b=OJRuVEsYS5qreuAylYOyoxBCDqC6HBjoKljLEWL2araMJezu32DeURmjQUrmTr8I+NfyyL
	5SfNXCW6TJbkDBNQxV0QOCF+HQNBxv3DbEePJbdJ3ZDBWzcHgnhKkNoRQXrM0nQrKICsIS
	JCXuE7V+PjqL3OF6PF/MM94KF4tJirE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-48-OD2IpWI7PKqKxAs2AmHLxA-1; Thu, 04 May 2023 03:22:06 -0400
X-MC-Unique: OD2IpWI7PKqKxAs2AmHLxA-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-94f29909e11so10847566b.2
        for <alex.bennee@linaro.org>; Thu, 04 May 2023 00:22:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683184925; x=1685776925;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e39Mds89jzC7NxhVhmQSaRaXl64OT15r7PbFamEUc1c=;
        b=BuGWL3JsI/olrmslQl+GZj86cNb62TSxF2VA4T1cdzrKna3fSka6imOE+/D5E4UINv
         fV9yCfNhWBMimF/PepAoJR7t4/ySy4rT2bc9y6iTIriqp1HBgVD9R3y3WpYp5sxmL/IY
         vPE9tqRJ3J2RpbFQvxSV6hCHcHdAme2BhexDFfErSK8Dg0nhVJrb1IrI80IaRAdt1Y/X
         Rdaq2XjEi0HPEf13GD+F/xsOenDTvo1A7R+76ABqOjXUPzABm8UinT+QS6+3ZlmtDgUZ
         fjE/wOI+xcnmBiGy/ax3e1FLg28zfrY6V0X8WYrZedZ3a6XkAfULrB+1uKbkjcH8fcfn
         BpgQ==
X-Gm-Message-State: AC+VfDw5yJITRKe5Ezy+47RTBZPSHzjbSCFLjBYPZWSRhDI8LQGc2MUw
	jKV/ct7kGo6GfsAU/RU+UK5YFjz5AGUlNOlT8gm4amfDfuak/NrUT5ROd1ghJ5h4RXYadGuZbz8
	P13wZE3ZfMFZT3Xj9
X-Received: by 2002:a17:906:fd84:b0:961:ba6c:e949 with SMTP id xa4-20020a170906fd8400b00961ba6ce949mr4779181ejb.68.1683184924925;
        Thu, 04 May 2023 00:22:04 -0700 (PDT)
X-Received: by 2002:a17:906:fd84:b0:961:ba6c:e949 with SMTP id xa4-20020a170906fd8400b00961ba6ce949mr4779164ejb.68.1683184924567;
        Thu, 04 May 2023 00:22:04 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045? ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
        by smtp.googlemail.com with ESMTPSA id jz26-20020a17090775fa00b009611a489a88sm7301063ejc.25.2023.05.04.00.22.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 00:22:03 -0700 (PDT)
Message-ID: <2065c9a7-48ca-1c8a-35a6-a62075536486@redhat.com>
Date: Thu, 4 May 2023 09:22:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 3/3] tests/qtest: Don't run cdrom tests if no accelerator
 is present
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20230503193833.29047-1-farosas@suse.de>
 <20230503193833.29047-4-farosas@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230503193833.29047-4-farosas@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: KRs+2k1j0xWy

On 5/3/23 21:38, Fabiano Rosas wrote:
> On a build configured with: --disable-tcg --enable-xen it is possible
> to produce a QEMU binary with no TCG nor KVM support. Skip the test if
> that's the case.
> 
> Fixes: 0c1ae3ff9d ("tests/qtest: Fix tests when no KVM or TCG are present")
> Signed-off-by: Fabiano Rosas<farosas@suse.de>

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

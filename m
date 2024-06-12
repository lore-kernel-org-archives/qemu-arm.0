Received: by 2002:a17:906:6a09:b0:a6f:1bf6:7fc1 with SMTP id qw9csp479893ejc;
        Wed, 12 Jun 2024 08:56:42 -0700 (PDT)
X-Received: by 2002:a05:6a20:841d:b0:1b5:b214:efcc with SMTP id adf61e73a8af0-1b8a9c88827mr2594800637.53.1718207802381;
        Wed, 12 Jun 2024 08:56:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718207802; cv=none;
        d=google.com; s=arc-20160816;
        b=lyLRuRmnGTdx0RimgemUxw2K4XEYSiluVO+MSypBPTIaWuJM/ps2rrDyqrNJbW1Gm4
         W4HjfDSuge+Ceohs+V6HqMfLupYIHRnm+Qbfty8IGrEALABNZCX+sYg5h7jepNhsJ+d6
         DnTGy57ICsBUgh6qe+qP1AlS1nYVwEH5rnFj73jNV1z4/a/lB+qFMD/1AJC4qt9/Olca
         kTMvW3rDTXQxB3OR/wXWETpNp1VNGVYO8B1n4y0doWVPRbC3OBhhQnn3CPwHqDH1TRc9
         YZg5arYQ3+OPpIeKnmxDMfIWyalMizVyD26ugXkjqCAJTRRTtZXE4sOgmZ2u2pm8DiJq
         fhIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=C/xS715ze4u55i++yoL/8pno/bPeipAfJy0uowYBN4g=;
        fh=eXv2JXwyEuypOQrX69yDQffVqZOElln6Rkijoj/t+TU=;
        b=Exb11fnloVy1/P9dAtsKE0V/ysd0KOhAL+ixSt2CCvYJ58gCUxqlHpvL+pdLxjGvqr
         BrWhd6qCbWgNsEHXOrmqy3DpuvKhFMoScTAT/dv/+KrKicBx/sdIDWcwoAlnGryzixrm
         /QRBqG14+zN09/x3N1gwrKDj8r4fj0gg7bbO1V5hcX0MF5gyTFSz54My2t4mDYDGVOeu
         OakY27DYricwqfJ2f4PLSlx3bpaP0GY+tcX/evJ6KzVjuW3mzu1Urc3q8kvhwqJiFFrH
         5HTFwhoWwBrq5gGiIgATMvd7u4NumWsIiE4UIB8Yk2y5hOfVUXh3C7l1sn2DW2OQVeV0
         POMA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k1dbgIFX;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-703fd39a64asor7829524b3a.4.2024.06.12.08.56.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 12 Jun 2024 08:56:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k1dbgIFX;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718207801; x=1718812601; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C/xS715ze4u55i++yoL/8pno/bPeipAfJy0uowYBN4g=;
        b=k1dbgIFXL+nUljFXtWbAwp29QNcRMjsLqAeUTj+q4Bjk23+ELwtQCNqvrzdO7El45b
         3GVi4nLkWrcUbbJg+YnWNefR1sk81C6voorErSzcJWGD/Sn63nHbkHQiMCnzfdaBF8rD
         txUBWEdcQqPc2igBNBSSychc+QwrQ1QZcYQep2JYAV6wBNHwAcaMj9RcJs7bahsH+0xm
         1JnWognKVvw9mqtLrPRLXClA1/Sw/1pcb/A/zX+RiP87v5VbcZ9gLUd4FMNUNHSGET/P
         JS4Is0JYyKwSO6PDc8jEJ2wRGYwQrX5sZLlUeej1kar6w+NTeF6tBmHn5VnBpgqWeNaZ
         09Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718207801; x=1718812601;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C/xS715ze4u55i++yoL/8pno/bPeipAfJy0uowYBN4g=;
        b=ECh7dxjLP/COE6J2yZa0Mu6XvuAn2dMaGMMjYI+tKHo48ReYsvWzAjk79XObYmxRK8
         vKjK21cFC3IA6bW8Ek4DZ4QHC4cLSA85rntBvnBNFBIjvtq/KIdUeyf8w/SmHKqArLv6
         iHzsUvftnjj1zKj3rGaQ22YgqfBXjV2musfU1F5K6DxDGqbfBQi3ve9bWnHxZyZ9jJ/l
         sIzo2WPdjkaws9RdEshIpupTeCA7ybipwwwuMB+HH8Oefo3TZOyAdytU9FcEO31VLT+5
         ll9uzGBLjGLdn9JjDEM0qNo8z9igdZwcUw/wjQHMOLu2loEoFE+eJuo88ZQLWsmfsQAp
         x68w==
X-Gm-Message-State: AOJu0YxzbWaGMs6k/Tdxb02dAa8gen2gFobEpeG6U3Ay3yjKDFBOAMy5
	zFE1Fl+PF9jGVFEitKkWYaTltdeDsyNV7yfMturJklM60pGZ0tJGBOuPJ3fPLfuKj2f/VNPxp1d
	fMKY=
X-Google-Smtp-Source: AGHT+IGMBCXE2LyecX+AfooXBwHBA7tsWopJGphYysIOn+9ELPlwsGk4Fvby1MO0dabHXRAuwqYMCQ==
X-Received: by 2002:a05:6a20:9183:b0:1b8:a0b3:c9d5 with SMTP id adf61e73a8af0-1b8a9c6891bmr2836434637.41.1718207800904;
        Wed, 12 Jun 2024 08:56:40 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from ?IPV6:2604:3d08:9384:1d00::2193? ([2604:3d08:9384:1d00::2193])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-704140681e5sm9072922b3a.125.2024.06.12.08.56.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 08:56:40 -0700 (PDT)
Message-ID: <8da3efe5-27cc-4017-a6de-b78e1ad48317@linaro.org>
Date: Wed, 12 Jun 2024 08:56:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] include/exec: add missing include guard comment
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Ilya Leoshkevich
 <iii@linux.ibm.com>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mark Burton <mburton@qti.qualcomm.com>, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Laurent Vivier <lvivier@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Alexandre Iooss <erdnaxe@crans.org>, qemu-arm@nongnu.org,
 Alexander Graf <agraf@csgraf.de>, Nicholas Piggin <npiggin@gmail.com>,
 Marco Liebel <mliebel@qti.qualcomm.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, qemu-ppc@nongnu.org,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Cameron Esfahani <dirty@apple.com>,
 Jamie Iles <quic_jiles@quicinc.com>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20240612153508.1532940-1-alex.bennee@linaro.org>
 <20240612153508.1532940-2-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20240612153508.1532940-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-TUID: /5tS2XLxQFQS

T24gNi8xMi8yNCAwODozNSwgQWxleCBCZW5uw6llIHdyb3RlOg0KPiBTaWduZWQtb2ZmLWJ5
OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+DQo+IC0tLQ0KPiAgIGlu
Y2x1ZGUvZXhlYy9nZGJzdHViLmggfCAyICstDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9l
eGVjL2dkYnN0dWIuaCBiL2luY2x1ZGUvZXhlYy9nZGJzdHViLmgNCj4gaW5kZXggZWIxNGI5
MTEzOS4uMDA4YTkyMTk4YSAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9leGVjL2dkYnN0dWIu
aA0KPiArKysgYi9pbmNsdWRlL2V4ZWMvZ2Ric3R1Yi5oDQo+IEBAIC0xNDQsNCArMTQ0LDQg
QEAgdm9pZCBnZGJfc2V0X3N0b3BfY3B1KENQVVN0YXRlICpjcHUpOw0KPiAgIC8qIGluIGdk
YnN0dWIteG1sLmMsIGdlbmVyYXRlZCBieSBzY3JpcHRzL2ZlYXR1cmVfdG9fYy5weSAqLw0K
PiAgIGV4dGVybiBjb25zdCBHREJGZWF0dXJlIGdkYl9zdGF0aWNfZmVhdHVyZXNbXTsNCj4g
ICANCj4gLSNlbmRpZg0KPiArI2VuZGlmIC8qIEdEQlNUVUJfSCAqLw0KDQpSZXZpZXdlZC1i
eTogUGllcnJpY2sgQm91dmllciA8cGllcnJpY2suYm91dmllckBsaW5hcm8ub3JnPg0K

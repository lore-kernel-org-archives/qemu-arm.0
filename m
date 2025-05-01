Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp272863njj;
        Thu, 1 May 2025 08:14:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUbI/EXBkXuZx6OTLMV38GmSRJfu7XQrcVGpRZLhBaKfaDYCYqpr8R1TR5tJwywf041GiM9WAL+/ZlYuQ==@linaro.org
X-Received: by 2002:a05:6a21:498e:b0:1f5:87a0:60ed with SMTP id adf61e73a8af0-20bd6e4c524mr3192969637.19.1746112485273;
        Thu, 01 May 2025 08:14:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746112485; cv=none;
        d=google.com; s=arc-20240605;
        b=YecIpkFjFTE0QQ5XgaDNIchI6NABtyA4qNAXifMSsz35EuYdjafFBwPPdopDt+uFEP
         iNEJRAHb8A88Sa6r20fxGpCYztbw35bgQ0WmbquRq5/0RuVGRfOfuq6n5e28AGMU0V8M
         ZP9SrUIkqEaz0AiyGSG/LJMGKHjNo7VPScHv2tEqqWXgdsC7/B0c78+gHdh9mmAaHS8t
         CErKD/Pi0sqDb4YmKBpGSkQyi7yRL5ItcR58PkZ6hQN9PDrpb6sJEoyhEN91sDHjyKfL
         AgkyzbftzTLqgU6ovAOtjrX+N9nz2Ur9WHE0DHHqjAST71WZgsnSzDx9Hj2C+s2WCdr+
         3oGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=jbLSF72pruch0HGWlc9WZf5BHEj56Rx4pJZa2a38Hks=;
        fh=V/53869BdcqNkX/gpwKS81+nftQVJsYJz66jU2WXLNA=;
        b=FQjs339eOawCO/5/bU69VAr5gsMT8vYsoQpDVxmD/fU958abqeAffXBsY74ZYBmtTz
         01xTF9KYelUf7TVpOJR/PqM0HYwN6cBdoXQ87/1oM58/lnJHas9La+A5HuVtpkG0CwRi
         k8xhnLDHjICOFF9IWEpsZdBfPzwA5RuJvolmVB25kc6tlHsDq3NC5c+OzJ3M2tmg/A0U
         JltjVsgFmx7pMFBYxzX21yyvvMVetLxyoo6Vtw9xZsMJdgs2J8YLr5FieCj9WZ0kMuyw
         jSu9kjZM6t4CXNb391NveMj4+lZkRl+Jr1hYkKVB26+Ql1YXWpoC2lb1fI79XoTgtr7W
         oaOA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xZw1ZMrp;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404fa0b34esor588795b3a.10.2025.05.01.08.14.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 01 May 2025 08:14:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xZw1ZMrp;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746112485; x=1746717285; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jbLSF72pruch0HGWlc9WZf5BHEj56Rx4pJZa2a38Hks=;
        b=xZw1ZMrpH4/8QdNb9gmIDa/YcZ15cP3AU9O6YkGEtxHYv3DYBcx19m7oKmAoeUhDmx
         j41lgsDc1nIAg0TB1ZSgOLadzzAPK6wvVnXiOZ9vuMQE+2lFw5Gr5szHzQtg6tkIdTZe
         YyqJ7nTojhAqA6lwi8ymmLAeTk3L3cx1AhmlmnBipdcliuEHWpvhJLvVbE5l5tkHW2BJ
         j6lxKQZd51JlmpXctrmLPBQnV5aqBAQizwSmJlcy8n6N6bpYCBJYCigYKTavfH/ZceKg
         7p4EJXvX3WA5VBEjm3G+IRFczLNsR2S54LC3sU96tJ2S4ANULHV7sc+VL36GsPoZ/5DT
         wsLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746112485; x=1746717285;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jbLSF72pruch0HGWlc9WZf5BHEj56Rx4pJZa2a38Hks=;
        b=Nl7mPba+BxDxClDqNOzIAapiXoNVfDkrwLSwUGQV0l2fSVmVcKKRrM50KbtVw94ugM
         RBLnF88POfK7LwavdMVvFA6UBKO9oy5rcylMCQCe8HxQ5F+UloBl+L+koJLeVthsaqrW
         MxWoEawsg32xgnOVriHx0qPaSUY0rAMLR/Up8MKi4q8XiX5mjuZAaU5jj57tjfzsUAz1
         6BRpYlYHDK2+l19KMkglujk6thn1ey6KD70HIOPJFZjOWgkhl4pkK1qIhC2b6UcfkA2P
         TxtTPGQztNGFgqKRZqNhvVhOncF49CYynYqGfwiDLMtBXQK8oPOTkYiYt1cLsINkk9U9
         zmxA==
X-Forwarded-Encrypted: i=1; AJvYcCWDlTaMVC7JBDRGEYNIxfWCFV1crrrrxQTf44EbEfo3wuVyHGBvw8yynG1Ge8n7ycjxs+ir2joiTv/27w==@linaro.org
X-Gm-Message-State: AOJu0Yxr/E5jn+tklg6GeYfrL40Se+trQMZzTemkcE6YCD1tgy01NqX2
	LuQtD8aJmsOT5A3TUQs+Fsu2eSbLPDfNApN15TuqxDMi2E2SUh5GT7DAaacInkxO/7iV7OYYqM8
	rM70=
X-Gm-Gg: ASbGncv8sWbfg5FiO/nsy0sSHGgDOqYYq9tbPr0d6d5OiS8gdn4b4O60IjtKefp0oHv
	+i6O05x8umJSVJ0nZrmnc8TiBuKFxkCEwSoPPyDLWUMyq4rb4UMdgow17DYSJ0/x5OkI8EA8L/T
	usTq0mEdW49qQR78XlABLRVbPXGY+D7E75HKxxX2XGSB6VeI2ksHnxPGf5xYbfFC2POLuzSUgPC
	5qzOchAkg+IgP9w8eqbyvX9asp/u0Vcg17jHv3Z2fEyV3utAXrLic4c3vO5FZ/6Zji9OPEj5i/J
	OcWV8nawOn1LAvH7bEkBUYLcX7g9Z/MV1O5eqcp4YA8EeSlXTqL+SDodSBPSlV6i1nlX40W6Jp2
	mp9H608o=
X-Google-Smtp-Source: AGHT+IFMgvqQh+s5Nyuz5qPHiDHOVmpKnz8SegFotdFjKojk6rVGT/GQv6niP61swtxBzwtl/6INPQ==
X-Received: by 2002:a05:6a00:2309:b0:73f:ff25:90b3 with SMTP id d2e1a72fcca58-74049275c32mr4772573b3a.24.1746112484843;
        Thu, 01 May 2025 08:14:44 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7404eeb1355sm917352b3a.20.2025.05.01.08.14.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 08:14:44 -0700 (PDT)
Message-ID: <50a5e081-97f9-4054-9b99-fdf1c1e88e72@linaro.org>
Date: Thu, 1 May 2025 08:14:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 18/33] target/arm/debug_helper: compile file twice
 (user, system)
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, Paolo Bonzini <pbonzini@redhat.com>, anjo@rev.ng,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 kvm@vger.kernel.org
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
 <20250501062344.2526061-19-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250501062344.2526061-19-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: /NIk2SP7N5wx

On 4/30/25 23:23, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/meson.build | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

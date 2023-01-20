Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1013607ejc;
        Fri, 20 Jan 2023 03:48:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv975KuH0plRj3IiVgxIBGQI2qY8BGSEQiMQHQsNAWMhJx8v89d1gvnjLkmHZL5mpBwVGMu
X-Received: by 2002:a05:622a:4317:b0:3b6:3494:174 with SMTP id el23-20020a05622a431700b003b634940174mr18152126qtb.52.1674215318780;
        Fri, 20 Jan 2023 03:48:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674215318; cv=none;
        d=google.com; s=arc-20160816;
        b=sMyiMrICFRsAFhkKo7y2sKdEY7Dix8Lbk086WcQrRh6xg7qly6B/ZBQcWaq+tbwNpI
         /5t6hrNes6coCqIGroDX2VD41J/5ljPt+CpP7czOreZ2PXAByXun6iOx3Or8VY2XntgY
         6qxaPp1QpK26KWzGuvUPvbZBwiMnRz/JG5ql2l6I+MzYpJm4Dg3gp+6SFQmfKBF3K84H
         E3g+Sdg4P2saVRQ4006ijgGS/pjMEXXAgy1KCSQNaOgTJS0QK6scMJF7ZXqy02vpEZge
         JinuWeyMSqyBxlf0u/UKTnwiWpgkfTqSg0mskg4CvVT57IJaGUB30WLpMz7Pe7vwO35O
         j2kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=bhkBgHAuK35g5bcK3lRDSW7p6p0MF0rwXGLB8aVNL6w=;
        b=xhcKYwntncuQRPiX3PR21Mc2XJkA4oiYZkuN+s0Sm23ZytWmNON7BB+EwDVhpLT7sc
         AG9xXmfMjyXHA6sHakbH7vzUudTit+nzzfM9RySUCXtlwkZ7b7WdgiZE4dE5N8rZxivn
         zSOXQPy+v44TvEHviggFYmZaFv58y+MAwfs8FqjKvdzDWUHZbqcUT9w0dkDoTnzie0Sl
         vhxPu/YtUhNh+LQYEgSaNt00i3End6lzFaS+FGsTnMo7garRKsvYxGa69pikdvwOnDO1
         E4E/t+kSynBm+TQCod0HNVGQSJOYnmCJWXQvKkQ0/s5vIZeTUGY+gBJXL8cfK3rVdlsC
         dvlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VT5gruRG;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id e19-20020ac85993000000b003b0e7c36057si2693441qte.759.2023.01.20.03.48.38
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 03:48:38 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VT5gruRG;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674215318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bhkBgHAuK35g5bcK3lRDSW7p6p0MF0rwXGLB8aVNL6w=;
	b=VT5gruRGWfmLAWS2x/eumF4Cj5WO5k6snU03BLfbzVA+4HOVe0Ju4wrpTNhe1OWbdLAJGS
	bccMknyk90bxAhMpJKA9Hblcb1ADID7f2zqHxWA5TeiE003XKp6xRv9DL00nxnZf8EfBdR
	8CF+o9BYqV+ha/YJ2NGmG/TgZ+TEmtA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-633-wMj28oFpMfuADDzIlzP_jQ-1; Fri, 20 Jan 2023 06:48:36 -0500
X-MC-Unique: wMj28oFpMfuADDzIlzP_jQ-1
Received: by mail-qk1-f197.google.com with SMTP id w17-20020a05620a425100b00706bf3b459eso3311275qko.11
        for <alex.bennee@linaro.org>; Fri, 20 Jan 2023 03:48:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bhkBgHAuK35g5bcK3lRDSW7p6p0MF0rwXGLB8aVNL6w=;
        b=0XPtlqDtJT7tiuPvNazTouSJ5LJ9wJPlMNowXFjqbaCT8Ky08BWxieV2anRBtzjeY0
         myUDD6Yd6JW3BoBZ0e4Wy/EdrjB/cFSLshGeyhDGSRhclvhFsDT7Lg/fhZ6Ao0JQqhEE
         2yFoutYBY2ysu+ZJ7DUMSkxbttaUVATM+kAE7+p/o3w7N6QRt/EO0VG7nU+gkTbsXuIF
         ICP5oVfqDlPSuXEAYPNh9xKSvCsdHjwRKrNlLr5CHqdNaAQPWOy3Ha1I7FXnb/dxe1Uu
         SgnDLSD+OFfx7vfY5ObQEHCVfmsCiSKTOHjOF71YNNnmNLgLQjyn3webJHcOHqmu3oqx
         GdLw==
X-Gm-Message-State: AFqh2kqaqWXvRodzD/nrCkNkXoEpAtnO2zlTY3T9RFTX1D1rdM+Wfcs8
	SE0A8ep6SsEyQKPHuE0lZTxf3PaRsQ3esRAC92IDgV2fthdrYalYUMbnv5ywoYu87oOtLM5X8xz
	sdemk0fsEkumo0cKY
X-Received: by 2002:a0c:8dc9:0:b0:534:fe24:db68 with SMTP id u9-20020a0c8dc9000000b00534fe24db68mr20566626qvb.4.1674215315913;
        Fri, 20 Jan 2023 03:48:35 -0800 (PST)
X-Received: by 2002:a0c:8dc9:0:b0:534:fe24:db68 with SMTP id u9-20020a0c8dc9000000b00534fe24db68mr20566610qvb.4.1674215315709;
        Fri, 20 Jan 2023 03:48:35 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.2] (ip-109-43-177-118.web.vodafone.de. [109.43.177.118])
        by smtp.gmail.com with ESMTPSA id n15-20020a05620a294f00b0070383f1b6f1sm26433301qkp.31.2023.01.20.03.48.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 03:48:35 -0800 (PST)
Message-ID: <20717e57-8524-5bca-efc3-ff294cda34f6@redhat.com>
Date: Fri, 20 Jan 2023 12:48:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFC PATCH v4 06/15] tests/qtest: Add qtest_get_machine_args
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20230119135424.5417-1-farosas@suse.de>
 <20230119135424.5417-7-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230119135424.5417-7-farosas@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: dwFtB4QHdlUo

On 19/01/2023 14.54, Fabiano Rosas wrote:
> QEMU machines might not have a default value defined for the -cpu
> option.

Which machines for example? ... I thought we'd have a default CPU everywhere?

  Thomas

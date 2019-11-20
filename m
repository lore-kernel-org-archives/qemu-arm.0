Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1764976lfc;
        Wed, 20 Nov 2019 01:58:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqw23hl2jb0MrOVXBMKH5fXygP6eX/LiNdpfcsdSE2DA7IcxTxTBqAcVLNJ5MHwR0kravsdw
X-Received: by 2002:ad4:58b1:: with SMTP id ea17mr1611735qvb.155.1574243918159;
        Wed, 20 Nov 2019 01:58:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574243918; cv=none;
        d=google.com; s=arc-20160816;
        b=GK7iCXpBtMmxkCeTEZRgXpa/SWqXCFnnGI3IH5UZclcBp+O0HUN2jTELkGW+wMdDwP
         38oHHUWtm8y0YXKfEeWqDXHFL5csH5WEAOib8+zJN4GqDL+teuXf2XdVNNIsyOQrwG07
         mfsTlTWoOEHRxAWadTl0dTJnhp8UpMQNIZceFO3dCAVGC8SdIF2O2C0Dl4pZ1xGRKw6l
         ET/C/XeJv1zOEN3VZ39qpJT9XdAPF74seZSSn096s1n3ovHswILC9fgaz1O+h2FNHBx3
         D8I6VdcUMtxCTz4s5431TsTHdPxOwD/lUEOKkyOPfPHuldOPZsbwl8RFFQ7yVDeQ/zJ0
         JeEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=O9xQYpyBt76UEq8p+FvnObMCUEWajQTRzfrWqVNDag4=;
        b=NuIfS6pB5NhXuX3BIe/LIiCOVytBP/+KB90n38ZdI9dM5gd1SMUGZd8aCSypoMXZpj
         nk8IlIynFSVO4dR3HOA2keTyyPlo6YFZDmJ2uG4pBISHEvb3s14Rdv6hy1HVuJfemnOw
         QneU98HDrTCdiQDVZljZJmfxXBhG8syaBzL8XdOAgRpV55EmR2rMdqfPy63QJUUvtmiU
         APZFzn6t5j+l7ePxxxHOk8nmodTGQjVfGMxC1eZCyoYh53jOAWueFlPuKnRa56Ci5LaJ
         PkR8hcD22Bs0E5SGCX+qP1VLqrLGstz1WFF0ROaFGkWvZj63KqgglHIwTYUdkTapASoy
         eStA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Cz3QgynD;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id ch2si15873520qvb.52.2019.11.20.01.58.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Nov 2019 01:58:38 -0800 (PST)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Cz3QgynD;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574243917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
	bh=O9xQYpyBt76UEq8p+FvnObMCUEWajQTRzfrWqVNDag4=;
	b=Cz3QgynDyxTU4x2TotEzkoHHfO2KLfEeyPRkz89GYggbC2w5Gi5KYiNm6W7WNoNqS/NDYP
	wkR/pelb4xaaurlh+feSuqsOm0OW2kGliqb0RbibkbAY24kRlg4/xQ1LWRqYZvkL+rl6FL
	/PsRVJeRqELmCCitpH05rthddEO30vg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-TPb0U2OyN8C_aYuYpo-HBg-1; Wed, 20 Nov 2019 04:58:36 -0500
Received: by mail-wr1-f70.google.com with SMTP id 92so20949113wro.14
        for <alex.bennee@linaro.org>; Wed, 20 Nov 2019 01:58:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=O9xQYpyBt76UEq8p+FvnObMCUEWajQTRzfrWqVNDag4=;
        b=icgC8BQkp5Hr1+ccZ0QCWf1brH+wAtjZBmxZfW8sUiI7xAaHzJ6U1LJJGQkwscqiQ9
         5PNvJ0kHxjbpT6K1pDRaB1WXHNTQ6cBKWT9bbYeBh1+hK6q3gQjXQ15YCMbQekPkFJ/T
         39spz4VfUphuZcla15clqupTn/P6IWPR+Or/vAwvbXoOsYSxXOULq+q4eMKI3NS6OqFO
         vA7D3cJVGfDk48FmMKffqy+impU395aeb9Af4BBbJ7owAS1stLlbbeo7bEqoN+1K1osW
         FegJelblviKfQxfEnIPGOdEBj5a4PDt1YaYfyuFhRPAdgoQItAzxnTJVOrgqgz1xHa64
         KzDw==
X-Gm-Message-State: APjAAAVOVj5HhchL4LL18iZEq0OV+wWewoDAz4qNbfD8fyJa6YfFrlSs
	I+WZ/crLKhp8nDk7lhQcn8JTjgbx+bnrNbyqgb1jbivZhfrYXXQLRa8QdM4T7ER3uuGR5ICo2+P
	VLSSfHSBNoCjTVf0D
X-Received: by 2002:adf:82cc:: with SMTP id 70mr142380wrc.231.1574243915167;
        Wed, 20 Nov 2019 01:58:35 -0800 (PST)
X-Received: by 2002:adf:82cc:: with SMTP id 70mr142354wrc.231.1574243914909;
        Wed, 20 Nov 2019 01:58:34 -0800 (PST)
Return-Path: <pbonzini@redhat.com>
Received: from ?IPv6:2001:b07:6468:f312:dc24:9a59:da87:5724? ([2001:b07:6468:f312:dc24:9a59:da87:5724])
        by smtp.gmail.com with ESMTPSA id v81sm6367455wmg.4.2019.11.20.01.58.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2019 01:58:34 -0800 (PST)
Subject: Re: [PATCH for-5.0 0/4] Remove the deprecated bluetooth subsystem
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-arm@nongnu.org, libvir-list@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20191120091014.16883-1-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <689a3583-9535-f744-1938-061ad0df114b@redhat.com>
Date: Wed, 20 Nov 2019 10:58:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191120091014.16883-1-thuth@redhat.com>
Content-Language: en-US
X-MC-Unique: TPb0U2OyN8C_aYuYpo-HBg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-TUID: uzp4IEFwGxRi

On 20/11/19 10:10, Thomas Huth wrote:
> This patch series removes the bitrotten bluetooth subsystem. See
> the patch description of the third patch for the rationale.

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

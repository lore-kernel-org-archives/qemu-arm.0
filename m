Received: by 10.182.105.169 with SMTP id gn9csp395738obb;
        Thu, 29 Oct 2015 02:43:08 -0700 (PDT)
X-Received: by 10.112.131.8 with SMTP id oi8mr342465lbb.99.1446111788710;
        Thu, 29 Oct 2015 02:43:08 -0700 (PDT)
Return-Path: <serge.fdrv@gmail.com>
Received: from mail-lb0-x235.google.com (mail-lb0-x235.google.com. [2a00:1450:4010:c04::235])
        by mx.google.com with ESMTPS id p67si468366lfd.147.2015.10.29.02.43.08
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2015 02:43:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c04::235 as permitted sender) client-ip=2a00:1450:4010:c04::235;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of serge.fdrv@gmail.com designates 2a00:1450:4010:c04::235 as permitted sender) smtp.mailfrom=serge.fdrv@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by lbbwb3 with SMTP id wb3so24259358lbb.1;
        Thu, 29 Oct 2015 02:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-type:content-transfer-encoding;
        bh=w8z95OviPgzQltS/1x17d3/BcQszc910pqy3hLoFxkM=;
        b=Fv4+5+RJQ/tlBI7TqzgMZ+Xbs66HIlAjErMX4GSV6abmv5fFbN8CATDST25ixzbmUx
         rR7JykUxS5PcNMvFC4JV1/HW1VCfUFSaRTMJJn5nDrVgl4Pa3jJWcPO32So9ysB+sBxQ
         rjk+aj/iSYzeu/JQMX0efaqDi+U8MCmRs+U2+eOCwduJOGOdjF7opq02TA8QZJb/AnN7
         oEsZ0n8sXNKbr8Q2daT0NWsCIo6zNsYYd/gPheDLGCN4PMAet/EXFe2ENwfDZxW2CVAg
         ZjRuwzZhU/ODAowTWuRcsBxubp4w0MRD6FBmhVQsa9qm8crPq6xJJLQVkStQTRhaxHpR
         mI3A==
X-Received: by 10.112.144.225 with SMTP id sp1mr405107lbb.97.1446111788412;
        Thu, 29 Oct 2015 02:43:08 -0700 (PDT)
Return-Path: <serge.fdrv@gmail.com>
Received: from [10.30.10.50] ([213.243.91.10])
        by smtp.googlemail.com with ESMTPSA id y204sm147189lfd.6.2015.10.29.02.43.07
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2015 02:43:07 -0700 (PDT)
Subject: Re: [Qemu-devel] proposal: new qemu-arm mailing list
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <CAFEAcA-s_hSQiLCkQDeX2rR12PcPx5yZ885yZy7C=ZWA5DDbTw@mail.gmail.com>
 <20151027110233.GE18847@toto>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Crosthwaite <crosthwaitepeter@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <5631EA2A.3060706@gmail.com>
Date: Thu, 29 Oct 2015 12:43:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <20151027110233.GE18847@toto>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-TUID: uyVQ6iw0eNQJ

On 27.10.2015 14:02, Edgar E. Iglesias wrote:
> On Tue, Oct 27, 2015 at 10:15:32AM +0000, Peter Maydell wrote:
>> Hi; it's been suggested to me that it would be helpful to have a
>> qemu-arm mailing list, along the lines of the existing qemu-ppc
>> and qemu-block lists. The idea would be to get people to cc the
>> list with their ARM related patches, so it would mostly act as
>> a way for people to filter their mail to separate the ARM stuff
>> out from the qemu-devel firehose. (Everything should still be
>> cc'd to qemu-devel as well.)
>>
>> Any objections/opinions?
>>
> Sounds good to me!

+1

Best regards,
Sergey

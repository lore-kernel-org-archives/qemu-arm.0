Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2287565lfg;
        Sat, 20 Mar 2021 10:52:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFb1RnUuJ6M/NLuUVrqm666vXZBQ9HViBbu5QmUFiXIZGuVE0fgU1PY1ygPeqINYjKKxGs
X-Received: by 2002:a25:7107:: with SMTP id m7mr15108614ybc.55.1616262741060;
        Sat, 20 Mar 2021 10:52:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616262741; cv=none;
        d=google.com; s=arc-20160816;
        b=AY6AC2Ep2eA4wYydDmi4z5bV4hJVpm2N7u7vpShSx30NjTpGKXXY2cKkoNlN8SoWWS
         JgUudeLNFlp0eMOMfJpv/wabv6R847YySCAmM0JJGmydlQ0wAMVORzylBnyQMpKvhje3
         9529BYaA1IrqofIZA1M+Uo8wt/Ye/LZ5iYsxpbeqJNDHf62vwxmwsMHZx46e7kgS98go
         5b+aJfxcjOBm7uV2D2YYnBbG4VZL2xsN3rf6lk4127f2pERGRzwfpbwbaskhleL1RdTl
         88k/mbv3z11851CKZHRr8Eb6S9a9ZSnuHZ3qUVg9uFP2LbKaqe7BO48n3k3606zVPuzN
         apGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:subject:from:references:to:dkim-signature;
        bh=+jZAd9HhlZg4BnTjX6jXLJJEr/uXVf9dPfUKNRs07Nc=;
        b=kIruYmPg3QnQK01a3RBpRIUIn0e/VTenxdAmgzbosNu8znO3jb51Gstock4sJT/WXu
         Qmj2NTKxdbmgfbG5/2BBOeER0vvVbNZEfp6zD+3YKIuXXtzUEHVBSME+i7z+eMnV1WEF
         LjV2XmzL4fdTosSYRJxOlXC1lylCBIwye30ewcDqgtSLYtRe/MfrZBycj84ArWbE/W/6
         qwz/beN8N5emyy3Qt2t6Of2QlrqVvcl4uBCTvHbd8GfSjY+edkYpdCGSc+lWGjhgxfT7
         5fXYWRqEHceQy63w2IHeBFzC2PRpBQi0GTsqAue9zfDBB+DDhjPEuF4skw/vIIa5nuIL
         aMiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TcBCTnG6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w17si9020776ybq.190.2021.03.20.10.52.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 20 Mar 2021 10:52:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TcBCTnG6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lNfls-0008W0-Cu
	for alex.bennee@linaro.org; Sat, 20 Mar 2021 13:52:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lNfli-0008UU-KM
 for qemu-arm@nongnu.org; Sat, 20 Mar 2021 13:52:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lNflg-0000af-3S
 for qemu-arm@nongnu.org; Sat, 20 Mar 2021 13:52:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616262727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+jZAd9HhlZg4BnTjX6jXLJJEr/uXVf9dPfUKNRs07Nc=;
 b=TcBCTnG6MBVbh8NhudncvgpOBuN9P5ofiTIqE5ZGKQwB8iY4Qyh1DqAnI5AmRIovpDwyP9
 lWpBbGP6QEepOjMezawe13YN6ugm5q3uLSDqSoMytnT9TRthG+asSt06ZtCZHlMhNQGd4L
 kOeWTcyUIsXsQ+y+ROsBQgcu9PgCcHw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-599-ahHNn5X6MAanvrnjEFRopA-1; Sat, 20 Mar 2021 13:52:03 -0400
X-MC-Unique: ahHNn5X6MAanvrnjEFRopA-1
Received: by mail-ed1-f72.google.com with SMTP id bi17so24679759edb.6
 for <qemu-arm@nongnu.org>; Sat, 20 Mar 2021 10:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+jZAd9HhlZg4BnTjX6jXLJJEr/uXVf9dPfUKNRs07Nc=;
 b=o0JLAdw/wIkkLrufamm/OpaN58CP/ERLozG/AVdIbyAhsIzu0hhbo0q+obYnykDFzF
 swxyc85m/ygcsV/CP0Cg9FPVorQEiWgJeZxWrosOpt1UDVRKkCUvAcWrv6BT7unnxkx3
 Q6XcxtCGQn+DdThF5qaaEKyvymJDfYU8Ly4W8STjgfnZpsZPuG8LjreIp7gm++M7D69O
 0f+EKeh3d+omMjoXX+N9dhhkLGlSujlfa7x7vvMHbx90o8HW2drrM4cNDLXH4rLV3roA
 0wf/MWIVlTlEN0m0V29YUgjZqXMKM7UJHZ5uMg/FS/ejJGZPYzdReyXctfKgNuYFTdSM
 5aKQ==
X-Gm-Message-State: AOAM5320EgAsIF1sAwA+a5BZmGm/Z83LPRjNHJ8HQUL98Uz36MQhUEjU
 pq6x4KIyTS029XSSpnpQaOqgTeZYM35p+VIXTPM7OgLnwEAn2EOPAw/Yv10Xo0Htm0orgognB1M
 FkPWMt7vWOFNw
X-Received: by 2002:a17:906:688:: with SMTP id
 u8mr10532203ejb.38.1616262722433; 
 Sat, 20 Mar 2021 10:52:02 -0700 (PDT)
X-Received: by 2002:a17:906:688:: with SMTP id
 u8mr10532188ejb.38.1616262722265; 
 Sat, 20 Mar 2021 10:52:02 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r17sm6572102edm.89.2021.03.20.10.52.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Mar 2021 10:52:01 -0700 (PDT)
To: Gavin Shan <gshan@redhat.com>, qemu-devel@nongnu.org
References: <20210320042753.69297-1-gshan@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] configure: Improve alias attribute check
Message-ID: <5a6e5d96-7b23-7a56-3096-fb80155cac26@redhat.com>
Date: Sat, 20 Mar 2021 18:52:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210320042753.69297-1-gshan@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: thuth@redhat.com, richard.henderson@linaro.org, laurent@vivier.eu,
 qemu-arm@nongnu.org, shan.gavin@gmail.com, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JyXGsh7wxeNN

On 20/03/21 05:27, Gavin Shan wrote:
> It's still possible that the wrong value is returned from the alias
> of variable even if the program can be compiled without issue. This
> improves the check by executing the binary to check the result.
> 
> If alias attribute can't be working properly, the @target_page in
> exec-vary.c will always return zeroes when we have the following gcc
> version.
> 
>   # gcc --version
>   gcc (GCC) 11.0.0 20210210 (Red Hat 11.0.0-0)
> 
> This abstracts the code from exec-vary.c and use it as indicator to
> enable gcc alias attribute or not.
> 
> +void write_x(int val);
> +
> +void write_x(int val)
> +{
> +    x = val;
> +}
> +
> +int main(void)
> +{
> +    return read_y();
> +}

I think this should be "read_y() == 1 ? 0 : 1".

I can reproduce it with -flto -O2 but not without -flto, do you agree?

Perhaps we can obtain the same optimization by wrapping reads of the 
page size in an inline __attribute__((const)) function.  Richard, what 
do you think?

Paolo


Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1204346lfp;
        Mon, 18 Jul 2022 02:55:23 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vZRJUFlm/Nulx1BSm1CXduutYJAWBRRzV50+xrDMIUtUQCAjEZxO8GG9iFv+TMfkuv3EG0
X-Received: by 2002:ac8:5c53:0:b0:31d:353b:7e35 with SMTP id j19-20020ac85c53000000b0031d353b7e35mr20865364qtj.554.1658138123016;
        Mon, 18 Jul 2022 02:55:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658138123; cv=none;
        d=google.com; s=arc-20160816;
        b=HgqtMp23UP+HUVg0mbozeofoJxz6aD/F1+d/sSCfLQ9LgKgZdfsTSUGUIfhE6+ob3K
         3iEzq+yPlIhAYTk9Oyme2uZTGpC4AknBtC+/w6hl/oDFT/PZ7QgZSctFvcQgJciJviix
         Det1MBSLkZl8vSAFAnRBHOxI6G5GJP3xncGDtRzX1SYQYnxSPA/znLHlDemtiZLxv62A
         QhYNWE9NhZN8eSM5+7cBiMQ/O3PqU5gME/GmiVQubPI+RyQovLYNHbqRApTeFAioi12G
         ZB8IV3KkWV8d6NRmeAMQ3L95q70LkzCqkF2av0Z71O3UYTlsFtvzBAVAw+EJJFORiltf
         VfYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=1WXlpbDhYOXlauu1JpDQTm8HXxFY29VxzzhSToLdBb4=;
        b=BV482wmjImGiBx+IaNVvh7QfBGeMfGOmkpR49K0gGcShITuLkvSlcytcLORPq/sPlw
         nJeoY65aeriEdwzUJAL5FbM1AmL/thiJkmAbFjpbifVbQh4K6FSYKvhLFRRS3xb02lFY
         CZJDTiId9CcjD3b07hWPGgAOF4bz80Qvi0LRhjgBPUIBPvqyLvLfPC0vj3tVY2jB/cIh
         Y/zBWZ/n2uf95a2nP11Zg8o0coO/AVBICrTayIjWbp97TWIp5dFt3ynQdS97iYXmdlds
         9Nu8PsW3eDYN4EkERFv0JMT6aKjDDMfRrbwO4aaH4VQYn1oJVQe1bkCainD8YCYUMbYz
         TkzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fr23XdI9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b8-20020ac87fc8000000b0031eb98f3e82si1045414qtk.56.2022.07.18.02.55.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Jul 2022 02:55:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fr23XdI9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oDNTG-0002z1-Hz
	for alex.bennee@linaro.org; Mon, 18 Jul 2022 05:55:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDNT1-0002xQ-Ox
 for qemu-arm@nongnu.org; Mon, 18 Jul 2022 05:55:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDNSy-0003kD-NW
 for qemu-arm@nongnu.org; Mon, 18 Jul 2022 05:55:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658138103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1WXlpbDhYOXlauu1JpDQTm8HXxFY29VxzzhSToLdBb4=;
 b=fr23XdI9YUTbye0SwFeA+fkuINGzi2OQ6wf/XB+SWRW7AdWsVz02UN7EH0fRFnBTaVJ+0c
 cWvSRIzB473D71FRi1+Hx8Nvdf3icwGKcruK2bIwttwyzhbOUhJqTpvPzCwfO3rrrcAYD8
 5clvBApW9YkFEd3gQngZNp+YgvD6aQU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-378-mWK1qRbPOSWKFgsLLpinmA-1; Mon, 18 Jul 2022 05:55:01 -0400
X-MC-Unique: mWK1qRbPOSWKFgsLLpinmA-1
Received: by mail-wr1-f71.google.com with SMTP id
 t13-20020adfe10d000000b0021bae3def1eso1861435wrz.3
 for <qemu-arm@nongnu.org>; Mon, 18 Jul 2022 02:55:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1WXlpbDhYOXlauu1JpDQTm8HXxFY29VxzzhSToLdBb4=;
 b=aCSRmYSyg+n8fIaRSHbVugKHtMJlogHqEfo3A2oMsU/5Kzi1t3P2l5wkLJAi+GISJC
 n+5pKf67rPfHy4RhYvPUUn7nAtiTQAo2MPMv65xSSbAYOOVZO9Jljw7qv+ROqHb47pkr
 n3U1aB0fAAio+V7cjyvBzn4GKbxbM+dckE6HE9+IZQmLZVi50DdrpQyVXI8USBCZVtmE
 gJFb0SxR61QMaUqIwDEPkUaN412ofW9DQQNeShrmfKxe3sddw160Ukwg6/+7LvkrQlAI
 gv4IZcBDu26A+msXs2bt39hwJJUyTyFyESk92P4xwdarHdDS7NQRaGDWNzVbMFdxVl5Y
 7yWQ==
X-Gm-Message-State: AJIora/sZ/ZoI7DUYPOB3nfFXY/DWw/aDI92vELWLqKriZf7D5qB+aIv
 bVloU/G50EtIH6wZifNpFN+wryrAaXrUn6LQCgdfPSIiPtcTfCXyayXhUddQ4IkJinNLNaXVI2P
 kV+fols0hTTu9
X-Received: by 2002:a1c:4444:0:b0:3a2:fe56:e8ca with SMTP id
 r65-20020a1c4444000000b003a2fe56e8camr21923043wma.21.1658138100472; 
 Mon, 18 Jul 2022 02:55:00 -0700 (PDT)
X-Received: by 2002:a1c:4444:0:b0:3a2:fe56:e8ca with SMTP id
 r65-20020a1c4444000000b003a2fe56e8camr21923010wma.21.1658138100197; 
 Mon, 18 Jul 2022 02:55:00 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-121.web.vodafone.de.
 [109.43.177.121]) by smtp.gmail.com with ESMTPSA id
 r129-20020a1c2b87000000b003a2eacc8179sm14714000wmr.27.2022.07.18.02.54.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jul 2022 02:54:59 -0700 (PDT)
Message-ID: <f07702b5-f139-0158-3d4f-8cbbdf8f9654@redhat.com>
Date: Mon, 18 Jul 2022 11:54:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v5 5/8] blockdev: Add a new IF type IF_OTHER
To: Markus Armbruster <armbru@redhat.com>, Hao Wu <wuhaotsh@google.com>
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, venture@google.com,
 Avi.Fishman@nuvoton.com, kfting@nuvoton.com, hskinnemoen@google.com,
 f4bug@amsat.org, bin.meng@windriver.com, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
References: <20220714182836.89602-1-wuhaotsh@google.com>
 <20220714182836.89602-6-wuhaotsh@google.com> <87ilnuda33.fsf@pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <87ilnuda33.fsf@pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5HK+x/21x3uz

On 18/07/2022 11.49, Markus Armbruster wrote:
[...]
> An OTP device isn't really a parallel flash, and neither are eFuses.
> More fast-and-lose use of IF_PFLASH may exist in the tree, and maybe of
> other interface types, too.
> 
> This patch introduces IF_OTHER.  The patch after next uses it for an
> EEPROM device.
> 
> Do we want IF_OTHER?
> 
> If no, I guess we get to abuse IF_PFLASH some more.
> 
> If yes, I guess we should use IF_PFLASH only for actual parallel flash
> memory going forward.  Cleaning up existing abuse of IF_PFLASH may not
> be worth the trouble, though.
> 
> Thoughts?

Maybe we should simply rename IF_PFLASH to IF_EPROM or IF_FLASH to make it 
clear that it is not only about parallel flashes anymore? Just my 0.02 €.

  Thomas


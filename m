Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1635ACA0EE4
	for <qemu-arm@archiver.kernel.org>; Thu, 14 Aug 2025 19:06:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umdHS-0005oo-8Q; Thu, 14 Aug 2025 15:06:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1umdHQ-0005oD-7a
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 15:06:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1umdHO-0004jB-A2
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 15:06:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755198380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uUL1Eo9mLwPqwkgmqo5zZ4C3h62UuS5naws4XvSgNGI=;
 b=LUgtXDKRJBNb3T68bgXuFzfq5vAvNNQzDEXZAm/2eg4yw6PhE6U9xzJd5lJlVRNUURIjQY
 a3p+HuR212wN3NJMWFjNY+vXk+7BV6qmxs75Lfmhim4brD9UqJcc3R5704U5lP9TDqIWvw
 y8AV5JcEVa7mtvnkwNWs5QedtejAZ6o=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-577-pkzn7RLlOsuH9FwdAyv-7Q-1; Thu, 14 Aug 2025 15:06:16 -0400
X-MC-Unique: pkzn7RLlOsuH9FwdAyv-7Q-1
X-Mimecast-MFC-AGG-ID: pkzn7RLlOsuH9FwdAyv-7Q_1755198375
Received: by mail-yb1-f200.google.com with SMTP id
 3f1490d57ef6-e931cae24a8so1644266276.1
 for <qemu-arm@nongnu.org>; Thu, 14 Aug 2025 12:06:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755198375; x=1755803175;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uUL1Eo9mLwPqwkgmqo5zZ4C3h62UuS5naws4XvSgNGI=;
 b=i+92RBcHVySYKY9s9Uwai5M8xHGvL2I8SwJT03e/BfO0o8eWJ9fUftwJnv76/isAd8
 CNoiZGn8skp8+yCw1m/tZq2GXH8pr79hv3ABY7n7cInOcspIdnEvdShHN1VE4uXBx98i
 RT3n0rRDtwOAkVyHDBdh60bh8WfCjgdJcqvARoh8s70gyEcZVqJDmcvFZMGmyGb6JKvY
 ccQk89+AUCMzZcm61sW0iiNQNxETDWG0l0oxKi6YZpeGtMHsaIjDbj/vNLhMW6sisKLt
 Hh5BVMrkWWs0Xl2IXBIyuBuQsYdGjeQjA1j6mENYT4E+bqDKpFlIqy8R26BcA7C9qFQi
 2hew==
X-Forwarded-Encrypted: i=1;
 AJvYcCWogBZKmmdNPCYzPne47kFi6DCzDiZXVFPm3GNG/h1/+Q6tLsK1Eplav5JBCKdkQMqzGWfQYELXfA==@nongnu.org
X-Gm-Message-State: AOJu0Yz9loFDFZdWwMTDb7c4G5AiilrV/HClmFbYbOvZhgceWfEcthqA
 VDFEolXC6Kuv7sKISUiWU2H7S7DxSQExRsy4GFNQ5avTnr79UKyzKwzgDZvAlikOofG9ua75ffr
 p6zqGsmSDiL0sidAT5RcdLIuqirwPnajvgU1tCEzLpl8VCeZmwkDRYA==
X-Gm-Gg: ASbGncv8r2VPT7GMIJh0a5gAvCp91xl5zILD6ZOaX01PyVGfjMDaJajKkQvZWLP9aV6
 TjHBcpmpDG1OAh4G4BP4erB3KWB8qUwFMPIpawbMoTPTGFCWpWxsxAIYyftiyzjgpC74ILjK7aE
 PBWy9TWl2P97EJIZiRKd5ELwcFG96D7fyzKzshpN33gkhEJkv3dQ5yreWOtIKpE434fZV8hi22x
 sVjSz0XCoiFyzL9Q9OqsypVM+5hjJKv83PFxvOxfgE8fsgr+wQoagbWwC3PoeL76hmIus2mTO+S
 2TPz4NMJLHZKqGEnGbLX3kF6BBq8veA9
X-Received: by 2002:a05:6902:5401:b0:e93:1316:449f with SMTP id
 3f1490d57ef6-e931e620294mr5175098276.24.1755198375536; 
 Thu, 14 Aug 2025 12:06:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFWSylGlXB+4yX0jjnA5ldgXe6qTeXZTpRlSX1jx3VBlDy8OLCSinQsVjTQDRvFTbzBghOOA==
X-Received: by 2002:a05:6902:5401:b0:e93:1316:449f with SMTP id
 3f1490d57ef6-e931e620294mr5175050276.24.1755198375140; 
 Thu, 14 Aug 2025 12:06:15 -0700 (PDT)
Received: from x1.local ([174.89.135.121]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-71d60fe17e2sm7960967b3.40.2025.08.14.12.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 12:06:14 -0700 (PDT)
Date: Thu, 14 Aug 2025 15:05:59 -0400
From: Peter Xu <peterx@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, mtosatti@redhat.com,
 richard.henderson@linaro.org, riku.voipio@iki.fi, thuth@redhat.com,
 pasic@linux.ibm.com, borntraeger@linux.ibm.com, david@redhat.com,
 jjherne@linux.ibm.com, shorne@gmail.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, zhao1.liu@intel.com,
 peter.maydell@linaro.org, agraf@csgraf.de, mads@ynddal.dk,
 mrolnik@gmail.com, deller@gmx.de, dirty@apple.com,
 rbolshakov@ddn.com, phil@philjordan.eu, reinoud@netbsd.org,
 sunilmut@microsoft.com, gaosong@loongson.cn, laurent@vivier.eu,
 edgar.iglesias@gmail.com, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, arikalo@gmail.com, chenhuacai@kernel.org,
 npiggin@gmail.com, rathc@linux.ibm.com, harshpb@linux.ibm.com,
 yoshinori.sato@nifty.com, iii@linux.ibm.com,
 mark.cave-ayland@ilande.co.uk, atar4qemu@gmail.com,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH v4 6/8] add cpu_test_interrupt()/cpu_set_interrupt()
 helpers and use them tree wide
Message-ID: <aJ4zl2-wSq8pm-Q6@x1.local>
References: <20250814160600.2327672-1-imammedo@redhat.com>
 <20250814160600.2327672-7-imammedo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20250814160600.2327672-7-imammedo@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Z0z26929tIUmXEc5b0PzpYCx1F8FpjsdsmmG_kN0IOE_1755198375
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, Aug 14, 2025 at 06:05:58PM +0200, Igor Mammedov wrote:
> the helpers form load-acquire/store-release pair and use them to replace
> open-coded checkers/setters consistently across the code, which
> ensures that appropriate barriers are in place in case checks happen
> outside of BQL.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

Thanks,

-- 
Peter Xu



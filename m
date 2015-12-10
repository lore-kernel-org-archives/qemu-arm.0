Received: by 10.182.158.201 with SMTP id ww9csp393960obb;
        Thu, 10 Dec 2015 02:49:15 -0800 (PST)
X-Received: by 10.140.32.196 with SMTP id h62mr14112720qgh.16.1449744555791;
        Thu, 10 Dec 2015 02:49:15 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z139si3283211qhz.55.2015.12.10.02.49.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 10 Dec 2015 02:49:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40406 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a6ymh-00089N-Fu
	for alex.bennee@linaro.org; Thu, 10 Dec 2015 05:49:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46919)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1a6ymf-00089D-Al
	for qemu-arm@nongnu.org; Thu, 10 Dec 2015 05:49:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1a6ymb-0004WB-BF
	for qemu-arm@nongnu.org; Thu, 10 Dec 2015 05:49:13 -0500
Received: from mx1.redhat.com ([209.132.183.28]:17708)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1a6ymb-0004W7-5N; Thu, 10 Dec 2015 05:49:09 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id BD28CC0B7A06;
	Thu, 10 Dec 2015 10:49:08 +0000 (UTC)
Received: from [10.3.112.28] (ovpn-112-28.phx2.redhat.com [10.3.112.28])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBAAn2fL017547
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 10 Dec 2015 05:49:05 -0500
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <1449742760-6310-1-git-send-email-armbru@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5669589E.4050904@redhat.com>
Date: Thu, 10 Dec 2015 11:49:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1449742760-6310-1-git-send-email-armbru@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-arm@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [Qemu-arm] [PATCH] Use error_fatal to simplify obvious fatal
	errors
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ryJRVqy9Y3ju



On 10/12/2015 11:19, Markus Armbruster wrote:
> +    object_property_set_int(OBJECT(cpu), ZYNQ_BOARD_MIDR, "midr",
> +                            &error_fatal);object_property_set_int(OBJECT(cpu),
> +                                                                  MPCORE_PERIPHBASE,
> +                                                                  "reset-cbar",
> +                                                                  &error_fatal);object_property_set_bool(OBJECT(cpu),
> +                                                                                                         true,
> +                                                                                                         "realized",
> +                                                                                                         &error_fatal);

Something went wrong here. :)

>  void qdev_prop_set_drive_nofail(DeviceState *dev, const char *name,
>                                  BlockBackend *value)
>  {
> -    Error *err = NULL;
> -
> -    qdev_prop_set_drive(dev, name, value, &err);
> -    if (err) {
> -        error_report_err(err);
> -        exit(1);
> -    }
> +    qdev_prop_set_drive(dev, name, value, &error_fatal);
>  }


This should be inlined entirely into the callers (possibly as a follow up).

Otherwise looks great, thanks!

Paolo
